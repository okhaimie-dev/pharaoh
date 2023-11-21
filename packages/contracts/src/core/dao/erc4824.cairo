use starknet::ContractAddress;

#[starknet::interface]
trait IERC4824<TContractAddress> {
    fn initialize(ref self: @TContractState, _dao_address: ContractAddress, _manager_address: ContractAddress, _uri: felt252);
    fn dao_uri(self: @TContractState) -> felt252;
}

#[event]
#[derive(Drop, starknet::Event)]
enum Event {
    DaoUriUpdate: DaoUriUpdate
}

#[derive(Drop, starknet::Event)]
struct DaoUriUpdate {
    uri: felt252,
}

#[starknet::contract]
mod ERC4824 {
    #[storage]
    struct Storage {
        dao_address: ContractAddress,
        manager_address: ContractAddress,
        dao_uri: felt252,
    }

    #[external(v0)]
    impl ERC4824Impl of super::IERC4824<ContractState> {
        fn initialize(ref self: ContractState, _dao_address: ContractAddress, _manager_address: ContractAddress, _uri: felt252) {
            self.dao_address.write(_dao_address);
            self.manager_address.write(_manager_address);
            self.dao_uri.write(_uri);
        }

        fn set_uri(ref self: ContractState, uri: felt252) {
            self.dao_uri.write(uri);
            self.emit(DaoUriUpdate { uri: uri })
        }

        fn dao_uri(self: @ContractState) -> felt252 {
            self.dao_uri.read()
        }
    }
}