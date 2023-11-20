---
title: DAO Framework 
nextjs:
  metadata:
    title: DAO Framework
    description: Quidem magni aut exercitationem maxime rerum eos.
---

Pharaoh stack consists of three key pieces: DAO Contracts, Permission Manager and Plugins.

---

## DAO

These is the underlining contracts with the core functionality of the protocol.

### Execution of Arbitrary Actions

The most important and basic functionality of the DAO is the execution of arbitrary functions, which allows you to execute the DAO's own functions as well as interacting with the rest of the world.

### Asset Management

The DAO provides basic asset management functionality to deposit, withdraw, and keep track of

- native
- ERC-20
- ERC-721
- ERC-1155

tokens in the treasury.

### Callback Handling

To interact with the DAO, external contracts might require certain callback functions to be present. Our `CallbackHandler` allows to register the required callback responses dynamically so that the DAO contract does not need to be upgraded.

---

## Permission Management

It is essential that only the right entites have permission to every aspect of the DAO, and employ the concept of least privilede when dealing with the DAO actors. This is why we borrow the concept of Aragon OSx DAO flexible and battle-tested permission manager being able to assign permissions for functionalities to specific addresses.
