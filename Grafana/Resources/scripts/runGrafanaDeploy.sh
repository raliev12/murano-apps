#!/bin/bash
#  Licensed under the Apache License, Version 2.0 (the "License"); you may
#  not use this file except in compliance with the License. You may obtain
#  a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#  License for the specific language governing permissions and limitations
#  under the License.

sudo apt-get update
wget https://grafanarel.s3.amazonaws.com/builds/grafana_3.0.2-1463383025_amd64.deb
sudo apt-get install -y adduser libfontconfig
sudo dpkg -i grafana_3.0.2-1463383025_amd64.deb
rm grafana_3.0.2-1463383025_amd64.deb

sudo iptables -I INPUT 1 -p tcp -m tcp --dport 3000 -j ACCEPT -m comment --comment "by murano, Grafana HTTP server on port 3000"
#sudo iptables -I INPUT 1 -p tcp -m tcp --dport 443 -j ACCEPT -m comment --comment "by murano, Apache server access on HTTPS port 443"
#sudo iptables -I INPUT 1 -p tcp -m tcp --dport 80 -j ACCEPT -m comment --comment "by murano, Apache server access on HTTP port 80"
