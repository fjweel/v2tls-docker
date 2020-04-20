#!/bin/sh
mkdir /tmp/v2ray
curl -L -H "Cache-Control: no-cache" -o /tmp/v2ray/v2ray.zip https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip /tmp/v2ray/v2ray.zip -d /tmp/v2ray
install -m 755 /tmp/v2ray/v2ray /usr/local/bin/v2ray
install -m 755 /tmp/v2ray/v2ctl /usr/local/bin/v2ctl
rm -f /v2ray/v2ctl
# Remove temporary directory
rm -rf /tmp/v2ray
install -d /usr/local/etc/v2ray
cat <<-EOF > /usr/local/etc/v2ray/config.json
{
  "inbounds": [
  {
    "port": 80,
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "ad806487-2d26-4636-98b6-ab85cc8521f7",
          "alterId": 64       
        }
      ]
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
      "path": "/ws"
      }     
    }
  }
  ],
  "outbounds": [
  {
    "protocol": "freedom",
    "settings": {}
  }
  ]
}
EOF
# Run V2Ray
nohup /usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json >out.txt 2>&1 &
cd /
mkdir /go
cd /go
wget https://github.com/byxiaopeng/imgtu/raw/master/go/gost
chmod +x /go/gost
/go/gost -L=ss://aes-256-cfb:peng@:8088
