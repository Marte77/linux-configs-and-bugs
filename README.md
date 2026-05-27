# Problems in Cachy


# backing settings up
To backup KDE settings and packages installed i used this script https://gitlab.com/cscs/transfuse
with the command `./transfuse -b $USER -p`

# mouse that is configured via WebUSB is not detected/configurable by the browser. (as of writing, WebUSB is only supported on chromium browsers)

this is some permissions thing wtr to udev. I found this [reddit post](https://www.reddit.com/r/linux_gaming/comments/1mc79a9/will_i_be_able_to_configure_this_mouse_on_linux/) and a reply by u/ifsixwerenine it solved the issue (cant link the reply for some reason).
Run the following command in the terminal:
```
lsusb
```
Find the peripheral you want (in my case):
```
Bus 001 Device 009: ID 5253:1021 RealTek MCHOSE A7 Pro
```

The values you want are the ones after ID, in my case 5253 for the idVendor and 1021 for the idProduct.

Then create/edit the following file (change vim with your desired text editor, or open the path with admin permissions):
```
sudo vim /etc/udev/rules.d/99-sycrox-v8.rules
```
And paste in the following, making sure to change the values for idVendor and idProduct:
```
KERNEL=="hidraw*", ATTRS{idVendor}=="5253", ATTRS{idProduct}=="1021", MODE="0666", TAG+="uaccess"
```

Then run the following commands to refresh and reload the configurations and permissions:
```
sudo udevadm control --reload-rules
sudo udevadm trigger
```

# certain apps would default back to the default mouse cursor icon
this happens with flatpack apps installed. idk the exact reason, but changing the location of the cursors to `~/.local/share/icons` instead of `~/.icons` fixed it.
