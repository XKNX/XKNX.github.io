---
layout: default
---

# [](#header-1)Outlets

## [](#header-2)Overview

Outlets are simple representations of binary actors. They mainly support switching on and off.

## [](#header-2)Example

```python
outlet = Outlet(xknx, 'TestOutlet', group_address='1/2/3')
xknx.devices.add(outlet)

# Accessing outlet
xknx.devices['TestOutlet'].set_on()
``` 

## [](#header-2)Configuration via **xknx.yaml**

Outlets are usually configured via [`xknx.yaml`](/configuration):

```yaml
groups:
    outlet:
        Livingroom.Outlet_1: {group_address: '1/3/1'}
        Livingroom.Outlet_2: {group_address: '1/3/2'} 
```

## [](#header-2)Interface


```python
outlet = Outlet(xknx, 'TestOutlet', group_address='1/2/3')

# Switching outlet on
outlet.set_on()

# Switching outlet off
outlet.set_off()

# Accessing outlet via 'do'
outlet.do('on')
outlet.do('off')

# Accessing state
print(outlet.state)

# Requesting state via KNX GROUP WRITE
outlet.sync()
```


