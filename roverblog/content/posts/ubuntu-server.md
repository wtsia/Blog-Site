+++
author = "Winston Tsia"
authorlink = ""
title = "Tips for an Ubuntu Server"
date = 2022-09-26T21:24:43-07:00
description = "Description"
tags = [
    "Ubuntu"
]
categories = [
    "IT",
    "Computer Networking",
]
math = true
notaxonomy = false
imagetext = "An example text for an image you could add!"
hidden = true
norobots = true
nodate = true
hidemeta = false
+++
## Useful server commands
```
//useful for monitoring changes to a `.log` file in real time.
watch -n 1 tail /var/log/<webserver>/<something>.log

// query icanhazip.com for your ip address
curl -4 icanhazip.com

// show ubuntu firewall status' numbered
sudo ufw status numbered

// delete 'n' rule
sudo ufw delete 'n'
```

# Setting up Reverse Proxy with Caddy or Nginx
To create a web server that is accessible from a domain, we will be using Caddy or Nginx proxy manager to set up our local reverse proxy and manage Nginx from a friendly UI.

## Caddy
```
echo "deb [trusted=yes] https://apt.fury.io/caddy/ /" | sudo tee -a /etc/apt/sources.list.d/caddy-fury.list

sudo apt update

sudo apt install caddy

sudo systemctl start caddy

// edit caddy file
sudo nano /etc/caddy/Caddyfile

sudo systemctl reload caddy

```

## Docker
### Installation
```
// update list. If your output seems abnormal, take a moment to think on your next step. This is a guide that worked for me on Ubuntu 22.04.1 LTS
sudo apt update

// install prerequisites:
sudo apt install apt-transport-https ca-certificates curl software-properties-common

// add a GPG key for the official Docker repo:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

// Add docker rpo to APT sources:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

// update existing list of packages
sudo apt update

// check you are installing from the Docker repo
apt-cache policy docker-ce

// install docker, docker container, containerd, cli and plugins
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

// check docker is installed
sudo systemctl status docker

// adding yourself as part of the docker group
sudo usermod -aG docker ${USER}

//log out and log back in or:
su - ${USER}
```
## Port Forwarding
- TCP/UDP: Connecting and holding to an endpoint/Sending a signal and hoping it arrives 
- dealing with busy port:
```
sudo netstat -nlptu | grep 80
sudo systemctl stop nginx
sudo systemctl stop apache
```

## Server Security
`sudo ufw enable`
- make sure to enable the server firewall. As of ubuntu 

## Maldet: Linux Malware Detection
Make sure to have `clamscan` installed so that maldet can utilize the clamav binary for the scanner engine.

`maldet --scan-all <directory>`: scan the entirety of a directory and subdirectories

`maldet -u`: update maldet
 

## Transcoding

To properly change track order of an `.mkv`:
```
mkvmerge --output "your_file (1).mkv" "(" "your_file.mkv" ")" --track-order 0:0,0:2,0:1
```

### Converting mkv to h264 with FFmpeg

EDIT: This question has become very popular and is one of the top results for searching "convert mkv to h264 ffmpeg" and thus I feel it is appropriate to add that for anyone stumbling upon this question to rather use
```
ffmpeg -i input.mkv -c:v libx264 -c:a aac output.mp4
```
[link](https://stackoverflow.com/questions/30898671/converting-mkv-to-h264-ffmpeg)

 