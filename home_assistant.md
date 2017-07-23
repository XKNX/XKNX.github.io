---
layout: default
---

# [](#header-1)Home Assistant plugin

[Home Assistant](https://home-assistant.io/) is a great framework for controlling all of your home automation devices.

XKNX interacts easily with Home Assitant but is not (yet) directly integrated into the homeassistant package - so it has to be installed manually


## [](#header-2)Installation

Clone XKNX library to your home directory:

```bash
cd $(HOME)
git clone https://github.com/XKNX/xknx.git
```

*Option 1*: Copy plugin files to your local homassistant configuration directory (`~/.homeassistant/custom_components`):

```bash
make install -C ~/xknx/home-assistant-plugin
```

*Option 2*: Create a symbolic link to your custom components directory. This only works of you only have the XKNX custom component installed, but has the advantage that it is easier to keep sync of updates:

```bash
mkdir -p ~/.homeassistant
ln -s ~/xknx/home-assistant-plugin/custom_components ~/.homeassistant/custom_components
```


Add the following section to your home assistant configuration (`~/.homeassistant/configuration.yaml`).  `config_file` should define the absolute path of your `xknx.yaml` )

```
xknx:
    config_file: /home/julius/xknx/xknx.yaml
```


## [](#header-2)Running

Add the location of the xknx library to `PYTHONPATH` when starting hass:

```
PYTHONPATH="${PYTHONPATH}:${HOME}/xknx" hass
```



#####

systemd:

```
# cat /etc/systemd/system/home-assistant@hass.service
[Unit]
Description=Home Assistant
After=network.target

[Service]
Type=simple
User=%i
ExecStart=/usr/bin/env PYTHONPATH="${PYTHONPATH}:${HOME}/xknx" /usr/local/bin/hass

[Install]
WantedBy=multi-user.target
```

