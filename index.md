XKNX
====

Introduction
------------

XKNX gives you full congrol of your KNX devices:

````python
from xknx import XKNX,Config

xknx = XKNX()
Config(xknx).read()

xknx.start()
xknx.devices.device_by_name("Livingroom.Outlet_1").set_on()
xknx.join()
````

