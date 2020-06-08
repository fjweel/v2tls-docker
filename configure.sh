#!/bin/sh
cat << EOF > /usr/local/etc/v2ray/config.json
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
                ],
                "disableInsecureEncryption": true
            },
            "streamSettings": {
                "network": "ws"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF
# Run V2Ray
/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json

