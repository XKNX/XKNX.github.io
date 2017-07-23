---
layout: default
---

# [](#header-1)Daemon

XKNX starts several processes in the background. These processes are:

* A telegram queue for handling a queue of telegrams.
* A Multicast daemon which is listening to the KNX mulitcast address and queuing received telegrams
* An update thread which calls the `sync_state` function of all devices. `sync_state` either writes a KNX-`GROUP_READ` to all connected devices or e.g. sends the time to the KNX bus (Time device).

## [](#header-2)Start of daemon

The XKNX Daemon is started via the start function:

````python
from xknx import XKNX
xknx = XKNX(config="xknx.yaml")
xknx.start()
````

If the start() function should not return and wait until the process is stopped simply use:

```python
xknx.start(True)
````

## [](#header-2)Finetune which threads to be be started

`xknx.start()` takes a start argument to control which threads to be started. The default is to start all available threads.

To start only telegram queue and state updater do:

````python
xknx.start(start=XKNX.START_TELEGRAM_QUEUE|XKNX.START_STATE_UPDATER)
````

## [](#header-2)Callback

You can also specify a callback called when a new telegram was received:

```python
from xknx import XKNX
import time

def device_updated_callback( xknx, device):

    print('Callback received from {0}'.format(device.name))

    if (device.name == 'Livingroom.Switch_1' ):
        outlet = xknx.devices['Livingroom.Outlet_1']
        if device.is_on():
            outlet.set_on()
        elif device.is_off():
            outlet.set_off()


xknx = XKNX()

xknx = XKNX(config="xknx.yaml")

xknx.start(True,
           device_updated_callback=device_updated_callback)
```


## [](#header-2)Graceful exit of process

`xknx.join()` waits until all telegrams were processed.
