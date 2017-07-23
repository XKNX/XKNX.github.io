---
layout: default
---

# [](#header-1)Home Assistant plugin

[Home Assistant](https://home-assistant.io/) is a great framework for controlling all of your home automation devices.

XKNX interacts easily with Home Assitant but is not (yet) directly integrated into the homeassistant package - so it has to be installed manually


## [](#header-2)Installation

*Option 1*: Copy plugin files to your local homassistant configuration directory (`~/.homeassistant/custom_components`):

```bash
git clone https://github.com/XKNX/xknx.git
make install -C ~/xknx/home-assistant-plugin
```

*Option 2*: Create a symbolic link to your custom components directory. This only works of you only have the XKNX custom component installed, but has the advantage that it is easier to keep sync of updates:

```bash
git clone https://github.com/XKNX/xknx.git
mkdir -p ~/.homeassistant
ln -s ~/xknx/home-assistant-plugin/custom_components ~/.homeassistant/custom_components
```

## [](#header-2)Configuration

Add the following section to your home assistant configuration (`~/.homeassistant/configuration.yaml`).  `config_file` should define the absolute path of your `xknx.yaml` )

```yaml
xknx:
    config_file: '/path/to/xknx.yaml'
```

If the autodetection of the KNX/IP device does not work you can specify ip/port of the tunneling device:

```yaml
xknx:
  config_file: '/path/to/xknx.yaml'
  tunneling:
    host: '192.168.2.23'
    port: 3671
```

If you want to connect via KNX/IP Routing

```yaml
xknx:
  config_file: '/path/to/xknx.yaml'
  routing:
     local_ip: '192.168.2.109'
```

## [](#header-2)Cloning XKNX-Homeassistant:

```bash
git clone git@github.com:XKNX/home-assistant.git
```

and follow instructions on https://home-assistant.io/developers/development_environment/ (not executing the `git clone` command a second time).
