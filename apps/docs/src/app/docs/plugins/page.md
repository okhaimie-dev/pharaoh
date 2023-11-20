---
title: Plugins
nextjs:
  metadata:
    title: Plugins
    description: Quidem magni aut exercitationem maxime rerum eos.
---

To add features beyond the base functionality available, you can customize your Pharaoh platform by installing a wide variety of plugins.

## Understanding Plugins

Whenever a DAO installs a plugin, an instance of that plugin's base template is deploted using the configuration parameters defined by the DAO. For example, you may want to use a specific token for your DAO's voting process, which means you have to determine this within your plugin's configuration parameters.

## How Does the DAO Manage a Plugin?

A DAO manages plugins and interaction between them. In more details, its permission manager:

- enables the plugin installation process through the granting and revoking of permissions for the DAO.
- authorizes calls to plugin functions carrying the `auth` modifier.
- authorizes calls to DAO functions, for example the `execute` function, allowing to act as the DAO.

Whereas deployed plugin instances belong to the DAO, the developer of the original plugin implementation owns the implementation and setup contract of the plugin. The plugin developer is the maintainer of an Aragon OSx plugin repo. Finally, the Aragon OSx protocol manages the registry in which the plugin repositories are listed, which is required to install a plugin using the Aragon OSx framework infrastructure to your DAO.

## What Does a Plugin Consist of?

Pharaoh's plugin consist of:

- The `PluginSetup` contract
  - referencing the `Plugin` implementation internally
  - containing the setup instructions to install, update, and uninstall it to an existing DAO.
- A metadata URI pointing to a `JSON` file containing the
  - Pharaoh frontend information
  - Information needed for the setup ABI
- A version tag consisting of a:
  - Release number
  - Build number

The `PluginSetup` is written by you, the plugin developer. The processing of the setup is managed by the PluginSetupProcessor, the central component of the setup process in the Pharaoh framework.

Each plugin with its different builds and releases is versioned inside its own plugin repositories in a PluginRepo contract, which is explained in the next section.
