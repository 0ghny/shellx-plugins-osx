# shellx-plugins-osx

ShellX plugins for Mac OS X

## Install

```shell
# Having shellx already installed and loaded into your SHELL
$ shellx::plugins::install https://github.com/0ghny/shellx-plugins-osx
```

## Configure

This plugin uses `@all` by default for configuration, it means, everything will be enabled by default.
If you wanna "disable some features", just exclude them using feature name in `SHELLX_PLUGIN_OSX_DISABLED_FEATURES` configuration variable.

The below example disabled installation of brew if not installed into the system.

```shell
SHELLX_PLUGIN_OSX_DISABLED_FEATURES=( brew_install )
```

Current features are (these are the names you need to use to disable them):

- brew: brew plugin, it load brew into the path
- brew_install: installs brew if not present into the system
