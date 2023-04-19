import os
x = os.popen("nmcli d|grep ' wifi '").read()

if "unavailable" in x:
    print("OFF")
elif "disconnected" in x:
    print("ON")
elif "connected" in x:
    x = x.replace('wlan0          wifi      connected               ','')
    x = x.strip()
    print(x)
