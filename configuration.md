---
layout: default
---

# [](#header-1)Configuration

## [](#header-2)Overview

XKNX is controlled via a configuration file. Per default the configuration file is  named `xknx.yaml`. 

The configuration file contains two section. The `general` section contains the individual / physical address of the XKNX daemon (`own_address`) and the IP address (`own_ip`) the XKNX daemon should bind to.

Within the `groups` sections all devices are defined. For each type of device more then one section might be specified. You need to append numbers or strings to differentiate the entries, as in the example below. The appended number or string must be unique. 

See the documentation of the devices for examples.

## [](#header-2)Example

```yaml
general:

    own_address: "15.15.249"
    own_ip: "127.0.0.1"

groups:

    switch:

        Livingroom.Switch_1:
            group_address: "1/2/7"
            actions:
              - {hook: "on", target: Livingroom.Outlet_1, method: "on"}
              - {hook: "on", target: Livingroom.Outlet_2, method: "on"}

        Livingroom.Switch_2:
            group_address: "1/2/8"
            actions:
              - {hook: "on", target: Livingroom.Outlet_1, method: "off"}
              - {hook: "on", target: Livingroom.Outlet_2, method: "off"}


        Livingroom.Switch_3:
            group_address: "1/2/2"
            actions:
              - {hook: "off", switch_time: "short", target: Livingroom.Shutter_1, method: short_up}
              - {hook: "off", switch_time: "long", target: Livingroom.Shutter_1, method: up} # Pressing more then 2 seconds

        Livingroom.Switch_4:
            group_address: "1/2/3"
            actions:
              - {hook: "off", switch_time: "short", target: Livingroom.Shutter_1, method: short_down}
              - {hook: "off", switch_time: "long", target: Livingroom.Shutter_1, method: down} # Pressing more then 2 seconds

    outlet:

        Livingroom.Outlet_1: {group_address: "1/3/1"}
        Livingroom.Outlet_2: {group_address: "1/3/2"}

    outlet 2:

        Kitchen.Outlet_1: {group_address: "1/3/7"}
        Kitchen.Outlet_2: {group_address: "1/3/8"}
        Kitchen.Outlet_3: {group_address: "1/3/9"}
        Kitchen.Outlet_4: {group_address: "1/3/10"}

    shutter:

        Livingroom.Shutter_1: {group_address_long: "1/4/1", group_address_short: "1/4/2", group_address_position_feedback: "1/4/3", group_address_position: "1/4/4", travel_time_down: 50, travel_time_up: 60 }
        Livingroom.Shutter_2: {group_address_long: "1/4/5", group_address_short: "1/4/6", group_address_position_feedback: "1/4/7", group_address_position: "1/4/8", travel_time_down: 50, travel_time_up: 60 }

        # Shutters without direct positioning:
        Livingroom.Shutter_3: {group_address_long: "1/4/9", group_address_short: "1/4/10", group_address_position_feedback: "1/4/11", travel_time_down: 50, travel_time_up: 60 }

        # Central Shutters dont have short or position address
        Central.Shutter: {group_address_long: "1/5/1" }

    light:

        Kitchen.Light_1:     {group_address_switch: "1/6/1", group_address_brightness: "1/6/3"}
        Diningroom.Light_1:  {group_address_switch: "1/6/4", group_address_brightness: "1/6/6"}
        Living-Room.Light_1: {group_address_switch: "1/6/7"}


    # Measuring temperature (setting temperature coming soon)
    thermostat:
        Kitchen.Thermostat_1: {group_address: "1/7/1"}

        Livingroom.Thermostat_2: {group_address: "1/7/2"}


    # Cyclic sending of time to the KNX bus

    time:
        General.Time: {group_address: "2/1/2"}
```
