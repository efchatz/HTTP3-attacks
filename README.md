# HTTP3-attacks (CVE-2022-30592)

The current repository serves the purpose of sharing the scripts we used for educational usage. These attacks were a part of our study, and were tested against 6 different QUIC-enabled servers (IIS, NGINX, LiteSpeed, Cloudflare, H2O, and Caddy). The http-stream script is the exploit of the [CVE-2022-30592](https://nvd.nist.gov/vuln/detail/CVE-2022-30592) issue that affected lsquic library. This script can also be exploited against Litespeed server.

## Installation procedure
For the exploitation of these attacks, the Ubuntu 18.04 client was used, with the assist of aioquic Python library for QUIC-loris and QUIC-Flooding. For QUIC-hash attack, the Scapy Python library v2.4.3 was used (pip install scapy==2.4.3). The following instructions occur the aioquic installation, for the QUIC-loris and QUIC-Flooding assaults.

1. git clone https://github.com/aiortc/aioquic
2. sudo apt install libssl-dev
3. cd aioquic
4. pip install -e .
5. pip install asgiref dnslib httpbin starlette wsproto
6. python3 setup.py install
7. add the quic-loris.sh file to the aioquic dir
8. initite the attack

Change the URL parameter to the one of the target. Note that based on the capabilities of the targeted server, different values maybe needed for each parameter on the exploits.

====================================================

MIT License

Copyright (c) 2022 Efstratios Chatzoglou

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
