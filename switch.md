---
layout: default
---

# [](#header-1)Time

## [](#header-2)Switches

The Switch class is a representation of a KNX touch sensor, like e.g the [GIRA KNX touch sensor 3 Plus 2](https://katalog.gira.de/en/datenblatt.html?id=638294).

Switches are mainly intended to act on input, which means to execute so called `Actions`. An action can be the switching of an outlet or light or the moving of a cover.

The logic within switches can further handle if a button is pressed shortly or not - and trigger different actions (`switch_time: 'long'`  or `switch_time: 'short'`).

## [](#header-2)Example

```python
outlet = Outlet(xknx, 'TestOutlet', group_address='1/2/3')
xknx.devices.devices.append(outlet)

switch = Switch(xknx, 'TestInput', group_address='1/2/3')
action_on = Action(
    xknx,
    hook='on',
    target='TestOutlet',
    method='on')
switch.actions.append(action_on)
action_off = Action(
    xknx,
    hook='off',
    target='TestOutlet',
    method='off')
switch.actions.append(action_off)
xknx.devices.add(switch)
``` 

## [](#header-2)Configuration via **xknx.yaml**

Time objects are usually configured via [`xknx.yaml`](/configuration):

```yaml
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
            group_address: "1/2/5"
            actions:
              - {hook: "off", switch_time: "long", target: Livingroom.Shutter_1, method: up}
              - {hook: "off", switch_time: "short", target: Livingroom.Shutter_1, method: short_up}

        Livingroom.Switch_4:
            group_address: "1/2/6"
            actions:
              - {hook: "off", switch_time: "long", target: Livingroom.Shutter_1, method: down}
              - {hook: "off", switch_time: "short", target: Livingroom.Shutter_1, method: short_down}


    outlet:
        Livingroom.Outlet_1: {group_address: '1/3/1'}
        Livingroom.Outlet_2: {group_address: '1/3/2'}

    shutter:
        Livingroom.Shutter_1: {group_address_long: 3171, group_address_short: 3172, group_address_position_feedback: 3173, group_address_position: 3174, travelling_time_down: 51, travelling_time_up: 61}



```



