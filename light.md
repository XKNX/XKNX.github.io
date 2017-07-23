---
layout: default
---

# [](#header-1)Light & Dimmer

## [](#header-2)Overview

The Light object is either a representation of a binary or a dimm actor. 

## [](#header-2)Example

```python
from xknx import XKNX, Light

# Generate light
xknx = XKNX()
light = Light(xknx,
              name='TestLight',
              group_address_switch='1/2/3',
              group_address_dimm='1/2/4',
              group_address_brightness='1/2/5')
xknx.devices.devices.append(light)

# Accessing light
xknx.devices['TestLight'].set_on()
xknx.devices['TestLight'].set_brightness(23)

# Wait until all events are processed
xknx.join()
``` 

## [](#header-2)Configuration via **xknx.yaml**

Outlets are usually configured via [`xknx.yaml`](/configuration):

```yaml
groups:
    light:

        # Lights with dimming
        Kitchen.Light_1:     {group_address_switch: '1/6/1', group_address_dimm: '1/6/2', group_address_brightness: '1/6/3'}
        Diningroom.Light_1:  {group_address_switch: '1/6/4', group_address_dimm: '1/6/5', group_address_brightness: '1/6/6'}

        # Light without dimming
        Living-Room.Light_1: {group_address_switch: '1/6/7'}
```


## [](#header-2)Interface


```python
from xknx import XKNX, Light

xknx = XKNX()
xknx.start()
light = Light(xknx,
              name='TestLight',
              group_address_switch='1/2/3',
              group_address_dimm='1/2/4',
              group_address_brightness='1/2/5')

# Switching light on
light.set_on()

# Switching light off
light.set_off()

# Set brightness
light.set_brightness(23)

# Accessing light via 'do'
light.do('on')
light.do('off')
light.do('brightness:80')

# Accessing state
print(light.state)
print(light.supports_dimming)
print(light.brightness)


# Requesting state via KNX GROUP WRITE
light.sync_state()
```


