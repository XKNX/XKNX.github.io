---
layout: default
---

# [](#header-1)Asynchronous Python Library for KNX

XKNX is an Asynchronous  Python library for reading and writing [KNX](https://en.wikipedia.org/wiki/KNX_(standard))/IP packets. 

## [](#header-2)Overview

* Connects to KNX Routing and Tunnel devices
* Fully Asynchronous, see [PEP 3156](https://www.python.org/dev/peps/pep-3156/)
* Easy to interact abstraction for devices
* Clean abstraction for easy implementation of building automation
* [Plugin](http://xknx.io/home_assistant) for the [Home-Assistant](https://home-assistant.io/) automation plattform

## [](#header-2)Installation

XKNX depends on Python >= 3.5. (All prior versions of Python < 3.5 have a bug in their multicast implementation.)

```bash
sudo pip3 install xknx
``` 

## [](#header-2)Hello World

```python
import asyncio
from xknx import XKNX, Light

async def main():
    xknx = XKNX()
    await xknx.start()
    light = Light(xknx,
                  name='HelloWorldLight',
                  group_address_switch='1/0/9')
    light.set_on()
    await asyncio.sleep(2)
    light.set_off()
    await xknx.stop()


# pylint: disable=invalid-name
loop = asyncio.get_event_loop()
loop.run_until_complete(main())
loop.close()
```

For more examples please check out the [examples page](https://github.com/XKNX/xknx/tree/master/examples)

# [](#header-1)Getting Help

For questions, feature requests, bugreports wither join the [XKNX chat on Discord](https://discord.gg/5XARFNT) or write an [email](mailto:xknx@xknx.io).


