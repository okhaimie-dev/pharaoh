use starknet::ContractAddress;

#[starknet::interface]
trait IDAO<TContractState> {
    fn increase_balance(ref self: TContractState, amount: felt252);
    fn has_permission(self: @TContractState, where: ContractAddress, who: ContractAddress, permission_id: felt252, data: felt252) -> bool;
    fn set_metadata(ref self: TContractState, metadata: felt252);
    fn execute(ref self: TContractState, call_id: felt252, allow_failure_map: u256) -> felt252;
    fn set_trusted_forwarder(ref self: TContractState, new_trusted_forwarder: ContractAddress);
    fn get_trusted_forwarder(self: @TContractState) -> ContractAddress;
    fn is_valid_signature(self: @TContractState, signature: felt252, hash: felt252) -> felt252;
    fn set_dao_uri(ref self: TContractState, new_dao_uri: felt252);
    fn dao_uri(self: @TContractState) -> felt252;
} 

#[starknet::contract]
mod DAO {
  use starknet::{ContractAddress, get_caller_address};

  #[storage]
  struct Storage {
    balance: felt252,
    dao_uri: felt252
  }

  #[event]
  #[derive(Drop, starknet::Event)]
  enum Event {
    DaoName: DaoName,
  }

  #[derive(Drop, starknet::Event)]
  struct DaoName {
    #[key]
    address: ContractAddress,
    name: felt252,
  }

  #[derive(Drop, starknet::Event)]
  struct Action {
    #[key]
    to: ContractAddress,
    value: u256,
    data: felt252,
  }

  #[external(v0)]
  impl DAO of super::IDAO<ContractState>{
    fn increase_balance(ref self: ContractState, amount: felt252) {
      assert(amount != 0, 'Amount cannot be 0');
      self.balance.write(self.balance.read() + amount);
    }

    fn set_trusted_forwarder(ref self: ContractState, new_trusted_forwarder: ContractAddress) -> ContractAddress {
      return new_trusted_forwarder;
    }

    fn set_dao_uri(ref self: ContractState, new_dao_uri: felt252) {
      self.dao_uri.write(new_dao_uri);
    }

    fn dao_uri(self: @ContractState) -> felt252 {
      self.dao_uri.read()
    }
  }
}