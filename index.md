XKNX
====

Installation
------------

````
sudo pip3 install xknx
````` 

Introduction
------------

XKNX gives you full control of your KNX devices:

````python
from xknx import XKNX,Config

xknx = XKNX()
Config(xknx).read()

xknx.start()
xknx.devices.device_by_name("Livingroom.Outlet_1").set_on()
xknx.join()
````

