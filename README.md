# HTTP3-attacks (CVE-2022-30592)

**Based on the work: E. Chatzoglou, V. Kouliaridis, G. Kambourakis, G. Karopoulos, and S. Gritzalis, ["A hands-on gaze on HTTP/3 security through the lens of HTTP/2 and a public dataset",](https://www.sciencedirect.com/science/article/pii/S0167404822004436) Computers & Security, p. 103051, 2022.**

The current repository serves the purpose of sharing the scripts we used for educational usage. These attacks were a part of our study, and were tested against 6 different QUIC-enabled servers (IIS, NGINX, LiteSpeed, Cloudflare, H2O, and Caddy) that were configured to communicate with HTTP/3. The http-stream script is the exploit of the [CVE-2022-30592](https://nvd.nist.gov/vuln/detail/CVE-2022-30592) issue that affected lsquic library. This script can also be exploited against Litespeed server.

## Installation procedure
For the exploitation of these attacks, the Ubuntu 18.04 client was used, with the assist of aioquic Python library for HTTP3-loris and HTTP3-stream. For HTTP3-flooding attack, the curl tool was used, with support of HTTP/3. The following instructions occur the aioquic installation, for the HTTP3-loris and HTTP3-stream assaults.

1. git clone https://github.com/aiortc/aioquic
2. sudo apt install libssl-dev
3. cd aioquic
4. If executing the HTTP3-stream attack, alter the MAX_TABLE_CAPACITY in aioquic library value to 16 or lower.
5. pip install -e .
6. pip install asgiref dnslib httpbin starlette wsproto
7. python3 setup.py install
8. Add the http3-loris.sh file to the aioquic dir
9. Initite the attack

Change the URL parameter to the one of the target. Note that based on the capabilities of the targeted server, different values maybe needed for each parameter on the exploits.

The following instructions occur the curl installation, for the HTTP3-flooding assault.

1. Add Dockerfile to a dir. The Dockerfile is inside the http-flood dir of the repository.
2. Add exploit to the same dir, in our case the http3-flood.sh file
3. Change the URL parameter in the exploit to the one of the target
4. docker build -t curl-http3 .
5. docker run -t -d --network host curl-http3
6. docker ps
7. docker cp /hostfile  (container_id):/(to_the_place_you_want_the_file_to_be)
8. docker exec -it container-id-curl-http3 bash

After the bash connection to the docker, execute ./http3-flood.sh.

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
