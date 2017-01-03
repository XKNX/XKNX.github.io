---
layout: default
---

# [](#header-1)XKNX

# [](#header-2)Installation

```bash
sudo pip3 install xknx
```` 

# [](#header-2)Introduction

XKNX gives you full control of your KNX devices:

```python
from xknx import XKNX,Config

xknx = XKNX()
Config(xknx).read()

xknx.start()
xknx.devices.device_by_name("Livingroom.Outlet_1").set_on()
xknx.join()
```

