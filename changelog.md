Changelog
=========

0.7.x (upcoming version, current dev branch)
------------------------

### More asyncio:

More intense usage of asyncio. All device operations and callback functions are now async. 

E.g. to switch on a light you have to do:

```python
await light.set_on()
```

See updated [examples](https://github.com/XKNX/xknx/tree/master/examples) for details.

### Renaming of several objects:

The naming of some device were changed in order to get the nomenclature closer to several other automation projects and to avoid confusion. The device objects were also moved into `xknx.devices`.

#### Climate

Renamed class `Thermostat` to `Climate` . Plase rename the section within configuration:

```yaml
groups:
    climate:
        Cellar.Thermostat: {group_address_temperature: '6/2/0'}
```

#### Cover

Renamed class `Shutter` to `Cover`. Plase rename the section within configuration:

```yaml
groups:
   cover:
        Livingroom.Shutter_1: {group_address_long: '1/4/1', group_address_short: '1/4/2', group_address_position_feedback: '1/4/3', group_address_position: '1/4/4', travel_time_down: 50, travel_time_up: 60 }
```

#### Binary Sensor

Renamed class `Switch` to `BinarySensor`. Plase rename the section within configuration:

```yaml
groups:
    binary_sensor:
        Kitchen.3Switch1:
            group_address: '5/0/0'
```

Sensors with `value_type=binary` are now integrated into the `BinarySensor` class:

```yaml
groups:
    binary_sensor:
        SleepingRoom.Motion.Sensor: {group_address: '6/0/0', device_class: 'motion'}
        ExtraRoom.Motion.Sensor: {group_address: '6/0/1', device_class: 'motion'}
```

The attribute `significant_bit` is now only possible within `binary_sensors`:

```yaml
groups:
    binary_sensor_motion_dection:
        Kitchen.Thermostat.Presence: {group_address: '3/0/2', device_class: 'motion', significant_bit: 2}
```

#### Switch

Renamed `Outlet` to `Switch` (Sorry for the confusion...). The configuration now looks like:

```yaml
groups:
    switch:
        Livingroom.Outlet_1: {group_address: '1/3/1'}
        Livingroom.Outlet_2: {group_address: '1/3/2'}
```


Within `Light` class i introduced an attribute `group_address_brightness_state`. The attribute `group_address_state` was renamed to `group_address_switch_state`. I also removed the attribute `group_address_dimm` (which did not have any implemented logic).

Version 0.6.2
-------------

XKNX Tunnel now does hartbeat - and reopens connections which are no longer valid.


Version 0.6.0
-------------

Using `asyncio` interface, XKNX has now to be stated and stopped asynchronously:

```python
import asyncio
from xknx import XKNX, Outlet

async def main():
    xknx = XKNX()
    await xknx.start()
    outlet = Outlet(xknx,
                    name='TestOutlet',
                    group_address='1/1/11')
    outlet.set_on()
    await asyncio.sleep(2)
    outlet.set_off()
    await xknx.stop()

# pylint: disable=invalid-name
loop = asyncio.get_event_loop()
loop.run_until_complete(main())
loop.close()
```

`sync_state` was renamed to `sync`:

````python
await sensor2.sync()
```


