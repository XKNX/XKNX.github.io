---
layout: default
---

Home Assistant plugin
=====================

Overview
--------

XKNX interacts easily with [Home Assistant](https://home-assistant.io/) but is not (yet) directly integrated into the homeassistant package - so it has to be installed manually. The XKNX Home Assistant Plugin has the following advantages to the current implementation:

XKNX...
* ... has [cooperative multitasking via asyncio](https://github.com/XKNX/xknx/blob/master/examples/example_light_state.py) and is 100% thread safe.
* ... is a Python library that cleanly exposes the API.
* ... provides support for [routing](https://github.com/XKNX/xknx/blob/master/xknx/io/routing.py) and [tunneling](https://github.com/XKNX/xknx/blob/master/xknx/io/tunnel.py) devices.
* ... has strong coverage with [unit tests](https://github.com/XKNX/xknx/tree/master/test).
* ... automatically updates and synchronizes all devices in the background periodically.
* ... listens for all updates of all devices on the KNX bus and updates the corresponding HASS device.
* ... has a clear abstraction of data/network/logic-layer.
* ... provides Heartbeat monitoring for Tunneling connections + clean reconnect if KNX/IP connection failed.
* ... does clean [connect](https://github.com/XKNX/xknx/blob/master/xknx/io/connect.py) and [disconnect](https://github.com/XKNX/xknx/blob/master/xknx/io/disconnect.py) requests to the tunneling device.


Configuration:
--------------

### Platform:

```yaml
xknx:
```

Optional, recommended for large KNX installations (>100 devices) and/or if you want to use the XKNX abstraction also for other scripted tools outside HASS:

```yaml
xknx:
  config_file: '/path/to/xknx.yaml'
```

If the autodetection of the KNX/IP device does not work you can specify ip/port of the tunneling device:

```yaml 
xknx:
  tunneling:
    host: '192.168.2.23'
    port: 3671
    local_ip: '192.168.2.109'
```

Explicit connction to a KNX/IP routing device:

```yaml
xknx:
  config_file: '/path/to/xknx.yaml'
  routing:
     local_ip: '192.168.2.109'
```

### Light:

```
light:
  - platform: xknx
    name: HASS-Kitchen-L-1
    address: '1/0/9'
    brightness_address: '1/0/11'

  - platform: xknx
    name: HASS-Kitchen-L-2
    address: '1/0/12'
    brightness_address: '1/0/14'
```

### Switch:

```
switch:
  - platform: xknx
    name: HASS-Kitchen.Coffee
    group_address: '1/1/6'
```

### Sensor:

```
sensor:
  - platform: xknx
    name: Heating.Valve1
    address: '2/0/0'
    value_type: 'percent'

  - platform: xknx
    name: HASS-Kitchen.Temperature
    address: '6/2/1'
    value_type: 'temperature'
```

### Binary Sensor:

```yaml
binary_sensor:
    - platform: xknx
      name: "Hass.Entrance.Motion.Sensor"
      address: '6/0/2'
      device_class: 'motion'
      #significant_bit: 2
```

device_class and significant_bit are optional.

You can also attach actions to binary sensors (e.g. to switch on a light when a switch was pressed). In this example I switch on one light when the button was pressed once and two others when the button was pressed a second time.

```yaml
    - platform: xknx
      name: HASS.Livingroom.3Switch3
      address: '5/0/26'
      automation:
        - counter: 1
          hook: 'on'
          action:
            - entity_id: light.hue_color_lamp_1
              service: homeassistant.turn_on
        - counter: 2
          hook: 'on'
          action:
            - entity_id: light.hue_bloom_1
              service: homeassistant.turn_on
            - entity_id: light.hue_bloom_2
              service: homeassistant.turn_on
```


### Cover*

````yaml
cover:
    - platform: xknx
      name: "HASS.Kitchen.Shutter"
      move_long_address: '3/0/0'
      move_short_address: '3/0/1'
      position_address: '3/0/3'
      position_state_address: '3/0/2'
      travelling_time_down: 51
      travelling_time_up: 61
```

### Climate:

```
climate:
   - platform: xknx
     name: HASS-Kitchen.Temperature
     temperature_address: '6/2/1'
     setpoint_address: '6/2/2'
```

Roadmap:
--------

* Add valve support. I want to control the valves of my floor heating.
* Add support for RTR as an automation plattform
        - taking temperature from Thermostats (KNX or others)
        - taking presence detectors
        - taking window open/close inputs
        - calculating and setting valve position
* Add notification plattform
        - KNX has some text messaging. The texts are displayed e.g. within
          wall-switches. We can add this as notification plattform


Todos:
------

*HASS MODULE:*

* decide about a name: `async_knx`? aknx? or just keep `xknx`? 
* Add validator for address
* I do not fully understand how the KNX setpoint works. I need help to geht this working. Winter is getting closer (at least in the Northern Hemisphere).


Known issues:
-------------

Due to lame multicast support the routing abstraction and the gateway scanner
only work with python >=3.5.


Manual Installation:
--------------------

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

