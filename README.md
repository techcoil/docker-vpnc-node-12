### Node 12 Docker image with vpnc

---

The image is based on `node:12` official docker image, and adds connectivity to IPSEC vpn

This is mostly usefull when you need to run scripts that access local network, or required a specific IP to run (such as making an SSH connection to firewall blocked server)


In order to connect to the vpn - one should pass the following environment variables to the image

| Name | Description |
| ---  | --- |
| `VPNC_GATEWAY` | The endpoint of the IPSEC VPN service|
| `VPNC_GROUP_ID` | Your VPN group name|
| `VPNC_GROUP_PSK` | your group password (Pre Shared Key) |
| `VPNC_USERNAME` | Username for VPN access |
| `VPNC_PASSWORD` | Password matching the username |

\* All the environment variables are required

---

For more information about VPNC - [read the manual here](https://linux.die.net/man/8/vpnc)
