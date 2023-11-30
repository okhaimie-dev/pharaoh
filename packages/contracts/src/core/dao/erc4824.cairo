#[starknet::interface]
trait IERC4824<TContractAddress> {
    fn dao_uri(self: @TContractState) -> felt252;
}

#[starknet::contract]
mod ERC4824 {
    #[storage]
    struct Storage {
        dao_uri: felt252,
        dao_address: starknet::ContractAddress,
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        DAOURIUpdate: DAOURIUpdate,
    }

    #[derive(Drop, starknet::Event)]
    struct DAOURIUpdate {
        dao_uri: felt252,
        dao_address: starknet::ContractAddress,
    }

    #[external(v0)]
    impl ERC4824Impl of super::IERC4824<ContractState> {
        fn dao_uri(self: @ContractState) -> felt252 {
            self.dao_uri.read()
        }
    }
}