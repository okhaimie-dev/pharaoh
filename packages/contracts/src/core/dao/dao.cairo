use starknet::{ContractAddress};

#[starknet::contract]
trait IDAO<TContractState> {

  /// Returns true if the given `who` has the permission `permission_id` in the given `where` contract.
  fn has_premission(ref self: TContractState, where: ContractAddress, who: ContractAddress, permission_id: felt252, data: felt252) -> bool;

  /// Executes the given actions.
  fn execute(self: TContractState, callId: felt252, actions: felt252, allow_failure_map: u128);

  /// Deposits the given `amount` of the given `token` to the DAO.
  fn deposit(self: TContractState, token: ContractAddress, amount: u128, reference: felt252);

  // Set signature validator
  fn set_signature_validator(self: TContractState, validator: ContractAddress);

  // Is signature valid
  fn is_valid_signature(self: TContractState, hash: felt252, signature: felt252) -> u128;

  // Set metadata
  fn set_metadata(self: TContractState, metadata: felt252);

  // Set Trusted Forwarder
  fn set_trusted_forwarder(self: TContractState, trusted_forwarder: ContractAddress);

  // Register token interface
  fn register_token_interface(self: TContractState);

  // Register standard callback
  fn register_standard_callback(self: TContractState, interface_id: felt252, callback_selector: felt252, magic_number: felt252);

  // DAO URI
  fn dao_uri(self: TContractState) -> felt252;

  // Set DAO URI
  fn set_dao_uri(self: TContractState, new_dao_uri: felt252);
}

#[starknet::contract]
mod DAO {
  use starknet::ContractAddress;
  use openzeppelin::token::erc20::interface::IERC20;

  #[storage]
  struct Storage {}

  #[external(v0)]
  // impl DAO of super::IDAO<ContractState> {

  //   fn has_premission(ref self: @ContractState, where: ContractAddress, who: ContractAddress, permission_id: felt252, data: felt252) -> bool {
  //     Storage::has_premission(where, who, permission_id, data)
  //   }

  //   fn execute(self: @ContractState, callId: felt252, actions: felt252, allow_failure_map: u128) {
  //     Storage::execute(callId, actions, allow_failure_map)
  //   }

  //   fn dao_uri(self: @ContractState) -> felt252 {
  //     Storage::get_dao_uri()
  //   }
  }
}