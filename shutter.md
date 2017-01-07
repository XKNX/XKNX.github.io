---
layout: default
---

# [](#header-1)Shutters

## [](#header-2)Overview

Shutters are simple representations of blind/roller shutter actuators. With XKNX you can move them up, down, to direct positions or stop them. Internally the class provides a calculation which calculates the current position while traveling.

## [](#header-2)Example

```python
from xknx import XKNX,Shutter

# Generate shutter
xknx = XKNX()
xknx.start()
shutter = Shutter(xknx,
                  'TestShutter',
                  group_address_long='1/2/1',
                  group_address_short='1/2/2',
                  group_address_position='1/2/3',
                  group_address_position_feedback='1/2/4',
                  travel_time_down=50,
                  travel_time_up=60)

xknx.devices.devices.append(shutter)

# Accessing shutter
xknx.devices.device_by_name('TestShutter').set_up()

# Wait until all events are processed
xknx.join()
```

## [](#header-2)Configuration via **xknx.yaml**

Shutters are usually configured via [`xknx.yaml`](/configuration):

```yaml
groups:
    shutter:
        Livingroom.Shutter_1: {group_address_long: '1/4/1', group_address_short: '1/4/2', group_address_position_feedback: '1/4/3', group_address_position: '1/4/4', travel_time_down: 50, travel_time_up: 60 }
```

```python
from xknx import XKNX,Config

xknx = XKNX()

Config(xknx).read()

xknx.start()
xknx.devices.device_by_name('Livingroom.Shutter_1').set_up()
xknx.join()
```

## [](#header-2)Interface


```python
from xknx import XKNX,Shutter

xknx = XKNX()
shutter = Shutter(xknx,
                  'TestShutter',
                  group_address_long='1/2/1',
                  group_address_short='1/2/2',
                  group_address_position='1/2/3',
                  group_address_position_feedback='1/2/4',
                  travel_time_down=50,
                  travel_time_up=60)

# Moving to up position
shutter.set_up()

# Moving to down position
shutter.set_down()

# Moving shutter a step up
shutter.set_short_up()

# Moving shutter a step down
shutter.set_short_down()

# Stopping shutter
shutter.stop()

# Moving shutter to absolute position
shutter.set_position(50)

# Requesting current state
# If requested position was not reached yet, XKNX will calculate the position
# out of last known position and defined traveling times
position = shutter.current_position()

# Helper functions to see if shutter is traveling or has reached final position
is_traveling = shutter.is_traveling()
position_reached = shutter.position_reached()

# Helper functions to see if shutter is fully closed or fully open
is_open = shutter.is_open()
is_closed = shutter.is_closed()

# Accessing shutter via 'do'
shutter.do('up')
shutter.do('short_up')
shutter.do('down')
shutter.do('short_down')

# Requesting state via KNX GROUP WRITE
shutter.sync_state()

```


