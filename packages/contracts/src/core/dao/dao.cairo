const EXECUTE_PERMISSION_ID: felt252 = selector!("EXECUTE_PERMISSION_ID");
const SET_METADATA_PERMISSION_ID: felt252 = selector!("SET_METADATA_PERMISSION_ID");
const SET_TRUSTED_FORWARDER_PERMISSION_ID: felt252 = selector!("SET_TRUSTED_FORWARDER_PERMISSION_ID");
const MAX_ACTIONS: felt252 = 256;

use starknet::class_hash::ClassHash;

#[starknet::interface]
trait IDAO<TContractState> {
  fn upgrade(ref self: TContractState, impl_hash: ClassHash);
  fn version(self: @TContractState) -> u8;
}

#[starknet::contract]
mod DAO {
  use starknet::class_hash::ClassHash;
  use starknet::SyscallResultTrait;
  use openzeppelin::access::accesscontrol::AccessControlComponent;
  use openzeppelin::access::accesscontrol::DEFAULT_ADMIN_ROLE;
  use openzeppelin::introspection::src5::SRC5Component;
  use starknet::ContractAddress;
  use super::{EXECUTE_PERMISSION_ID, SET_METADATA_PERMISSION_ID, SET_TRUSTED_FORWARDER_PERMISSION_ID, MAX_ACTIONS};

  component!(path: AccessControlComponent, storage: accesscontrol, event: AccessControlEvent);
  component!(path: SRC5Component, storage: src5, event: SRC5Event);

  // AccessControl
  #[abi(embed_v0)]
  impl AccessControlImpl = AccessControlComponent::AccessControlImpl<ContractState>;
  impl AccessControlInternalImpl = AccessControlComponent::InternalImpl<ContractState>;

  // SRC5
  #[abi(embed_v0)]
  impl SRC5Impl = SRC5Component::SRC5Impl<ContractState>;

  #[storage]
  struct Storage {
    #[substorage(v0)]
    accesscontrol: AccessControlComponent::Storage,
    #[substorage(v0)]
    src5: SRC5Component::Storage,
  }

  #[event]
  #[derive(Drop, starknet::Event)]
  enum Event {
    AccessControlEvent: AccessControlComponent::Event,
    SRC5Event: SRC5Component::Event,
    Upgraded: Upgraded,
  }

  #[derive(Drop, starknet::Event)]
  struct Upgraded {
    implementation: ClassHash
  }

  #[constructor]
  fn constructor(
    ref self: ContractState,
    admin: ContractAddress,
  ) {
    // AccessControl-related initialization
    self.accesscontrol.initializer();
    self.accesscontrol._grant_role(DEFAULT_ADMIN_ROLE, admin);
  }

  #[abi(embed_v0)]
  impl DAO of super::IDAO<ContractState> {
    fn upgrade(ref self: ContractState, impl_hash: ClassHash) {
      self.accesscontrol.assert_only_role(DEFAULT_ADMIN_ROLE);
      assert(!impl_hash.is_zero(), 'Class hash cannot be zero');
      starknet::replace_class_syscall(impl_hash).unwrap_syscall();
      self.emit(Event::Upgraded(Upgraded { implementation: impl_hash }))
    }

    fn version(self: @ContractState) -> u8 {
      1
    }
  }
}