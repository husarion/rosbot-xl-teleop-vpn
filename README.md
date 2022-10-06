# rosbot-xl-navigation-vpn

A GitHub template for ROSbot XL: autonomous navigation &amp; mapping

## Quick Start

### ROSbot XL

#### Configuring Husarnet VPN

```bash
sudo systemctl enable husarnet
sudo systemctl start husarnet
```

Export your Husarnet Join Code under the `$JOINCODE` env:

```bash
export JOINCODE=fc94:b01d:1803:8dd8:b293:5c7d:7639:932a/XXXXXXXXXXXXXXXXXXXXXX
```

And join your ROSbot XL to the Husarnet network under `rosbot-xl` hostname:

```bash
sudo husarnet join $HUSARNET_JOINCODE rosbot2r
```

#### Pulling all Docker images

```bash
docker compose -f compose.rosbot.mapping.yaml pull
```

#### Flashing the firmware

Set dip switch no. 3 on ROSbot XL digital board to **"on" state** (`BOOT0` pin to HIGH) and click the `RESET` button, to enter the programming mode.

Execute in a termianl on your laptop:

```bash
docker run --rm -it \
--device /dev/ttyUSB0:/dev/ttyUSB0 \
husarion/rosbot-xl:humble \
/stm32flash -w /firmware.bin -b 115200 -v /dev/ttyUSB0
```

Set dip switch no. 3 to **"off" state**  (`BOOT0` pin to LOW) and click the `RESET` button to start a newly flashed firmware.

#### Running containers

```bash
docker compose -f compose.rosbot.mapping.yaml up
```

### User's PC

#### Configuring Husarnet VPN

```bash
curl https://install.husarnet.com/install.sh | sudo bash
```

```bash
sudo systemctl restart husarnet
```

Export your Husarnet Join Code (the same as for ROSbot) under the `$JOINCODE` env:

```bash
export JOINCODE=fc94:b01d:1803:8dd8:b293:5c7d:7639:932a/XXXXXXXXXXXXXXXXXXXXXX
```

And join your laptop to the Husarnet network under preffered hostname:

```bash
sudo husarnet join $HUSARNET_JOINCODE my-laptop
```

#### Pulling all Docker images

```bash
docker compose -f compose.rviz.yaml pull
```

#### Running containers

```bash
docker compose -f compose.rviz.yaml up
```