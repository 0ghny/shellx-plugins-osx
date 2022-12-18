# shellcheck shell=bash
# brew plugin (this plugins is enabled by default)
#  This plugin configures BREW into the shell if is installed into the sytem.
# feature:
#  brew: enables /usr/local/sbin into the path to hack a common issue with brew in osx
#  brew_install: installs brew if not present before load it

SHELLX_PLUGIN_OSX_BREW_NAME="OSX_BREW"

if  [[ ! "${SHELLX_PLUGIN_OSX_DISABLED_FEATURES}" =~ "@all" ]] && \
    [[ ! "${SHELLX_PLUGIN_OSX_DISABLED_FEATURES}" =~ "brew_install" ]]; then
  shellx::plugins::log_debug "${SHELLX_PLUGIN_OSX_BREW_NAME}" "Feature brew_install enabled"
  if ! command -v brew >/dev/null; then
    shellx::plugins::log_info "${SHELLX_PLUGIN_OSX_BREW_NAME}" "brew not present, installing it, it may ask for SUDO"
    echo "shellx-plugins-osx will proceed with brew installation, it may ask you for permissions"
    echo "if you wanna install brew by yourself, please, CTRL+C to kill this process and visit https://brew.sh"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    shellx::plugins::log_debug "${SHELLX_PLUGIN_OSX_BREW_NAME}" "brew present into the system, skipping install"
  fi
fi

# .............................................................................
# if brew is available, include brew sbin into the path
# osx brew hack
# .............................................................................
if  [[ ! "${SHELLX_PLUGIN_OSX_FEATURES}" =~ "@all" ]] && \
    [[ ! "${SHELLX_PLUGIN_OSX_FEATURES}" =~ "brew" ]]; then
  shellx::plugins::log_debug "${SHELLX_PLUGIN_OSX_BREW_NAME}" "adding brew dir to the path, this is called osx brew hack"
  command -v brew >/dev/null && \
    export PATH="/usr/local/sbin:$PATH"
fi
