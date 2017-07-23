---
layout: default
---

# [](#header-1)Sensor - Monitor values of KNX

## [](#header-2)Overview



## [](#header-2)Configuration via **xknx.yaml**

Time objects are usually configured via [`xknx.yaml`](/configuration):

```yaml
groups:
    monitor:
        Heating.Valve1: {group_address: '2/0/0', value_type: 'percent'}
        Heating.Valve2: {group_address: '2/0/1', value_type: 'percent'}
        Some.Other.Value: {group_address: '2/0/2'}
```

## [](#header-2)Daemon mode

When XKNX is started in [daemon mode](/xknx), with START_STATE_UPDATER enabled, XKNX will automatically request the states from KNX bus with the `sync_state`-loop. 

```python
from xknx import XKNX

xknx = XKNX(config="xknx.yaml")

# Starting XKNX in daemon mode
xknx.start(True)
```

## [](#header-2)Interface


#```python
#from xknx import XKNX,Time
#
#xknx = XKNX()
#time = Time(xknx, 'TimeTest', group_address='1/2/3')
#
## Sending Time to KNX bus 
#time.sync_state()
#```


