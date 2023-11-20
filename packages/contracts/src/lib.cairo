// Declare modules.

// `core` the primatives that end users will interact with.
mod core {
    // the main contracts of our core
    mod dao {
        mod dao;
    }

    // govern interactions between plugins, daos and other addresses.
    mod permission {
        mod permission;
    }

    // base templates of plugins to build upon.
    mod plugin {
        mod plugin;
    }

    mod utils {
        mod utils;
    }
}


// #[starknet::interface]
// trait IHelloStarknet<TContractState> {
//     fn increase_balance(ref self: TContractState, amount: felt252);
//     fn get_balance(self: @TContractState) -> felt252;
// }

// #[starknet::contract]
// mod HelloStarknet {
//     #[storage]
//     struct Storage {
//         balance: felt252, 
//     }

//     #[external(v0)]
//     impl HelloStarknetImpl of super::IHelloStarknet<ContractState> {
//         fn increase_balance(ref self: ContractState, amount: felt252) {
//             assert(amount != 0, 'Amount cannot be 0');
//             self.balance.write(self.balance.read() + amount);
//         }

//         fn get_balance(self: @ContractState) -> felt252 {
//             self.balance.read()
//         }
//     }
// }
