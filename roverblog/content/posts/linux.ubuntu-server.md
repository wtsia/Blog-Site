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
# Contents
- [Contents](#contents)
  - [Useful Commands](#useful-commands)
    - [Ubuntu Server Troubleshooting](#ubuntu-server-troubleshooting)
  - [useful text editor shortcuts](#useful-text-editor-shortcuts)
- [Setting up Reverse Proxy with Caddy or Nginx](#setting-up-reverse-proxy-with-caddy-or-nginx)
  - [Caddy](#caddy)
- [Docker](#docker)
  - [Installation](#installation)
  - [Docker: Portainer](#docker-portainer)
    - [Docker Commands/Operations](#docker-commandsoperations)
  - [Docker: Nginx Proxy Manager](#docker-nginx-proxy-manager)
- [Nginx](#nginx)
  - [Port Forwarding](#port-forwarding)
- [Server Security](#server-security)
  - [Fail2ban](#fail2ban)
  - [Maldet: Linux Malware Detection](#maldet-linux-malware-detection)
    - [Installation](#installation-1)
- [Media](#media)
  - [Jellyfin](#jellyfin)
    - [Unlock locked user account](#unlock-locked-user-account)
    - [SQLite3 Cheat Sheet](#sqlite3-cheat-sheet)
      - [Basics](#basics)
      - [Managing databases](#managing-databases)
      - [Managing indexes](#managing-indexes)
      - [Querying Data](#querying-data)
      - [Changing Data](#changing-data)
    - [Installing Jellyfin (Docker)](#installing-jellyfin-docker)
    - [Transcoding](#transcoding)
    - [Converting mkv to h264 with FFmpeg](#converting-mkv-to-h264-with-ffmpeg)
    - [HEVC x265 to MP4 x264](#hevc-x265-to-mp4-x264)
## Useful Commands
```
//useful for monitoring changes to a `.log` file in real time.
watch -n 1 tail /var/log/<webserver>/<something>.log

// query icanhazip.com for your ip address
curl -4 icanhazip.com

// show ubuntu firewall status' numbered
sudo ufw status numbered

// delete 'n' rule
sudo ufw delete 'n'

// mounting drives
sudo lsblk
sudo fdisk -l           // list drives
sudo blkid              // get uuid of drive
sudo nano /etc/fstab    // edit fstab using nano
# example of a disk mount
/dev/disk/by-uuid/6cb3542a-02ab-4df6-8bce-4c193a2f839b  /<directory for mount>  <storage type like ext4>    defaults    0   0    
sudo mount -a

// show video card drivers
lshw -c video

// traceroute
traceroute -m <max num hops> -p <port> <site>

// unlocking Luks Drive
sudo cryptsetup open /dev/sdd3 luksrecoverytarget  --type luks

// view formatted systemctl logs
journalctl -u <service> --no-pager | less

// rsync
rsync -rtvu source_folder/ destination_folder/
// -v verbose
// -t 
// -u 
// -r recursive

//ubuntu drivers
sudo ubuntu-drivers devices

// make filename.sh executable
chmod +x filename.sh

```

### Ubuntu Server Troubleshooting
- allocated space not totally filled (seen after `lsblk`)
```
// ubuntu stack overflow
I also used the default Ubuntu 20.04 install from ISO w/ lvm option selected. I had the same problem with the OS disk not occupying what I had allocated. Eddie's suggestion and the provided link did it for me. To summarize:

root@util:~# vgdisplay
<snip>
root@util:~# lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
<snip>
root@util:~# resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
<snip>
```

 
## useful text editor shortcuts
```
// NANO
Ctrl + 6 to set a mark.
Alt + T will delete all content in a file.
Ctrl + K will delete the current line at your cursor.
```


# Setting up Reverse Proxy with Caddy or Nginx
To create a web server that is accessible from a domain, we will be using Caddy or Nginx proxy manager to set up our local reverse proxy and manage Nginx from a friendly UI.

## Caddy
[Caddy Installation Documentation](https://caddyserver.com/docs/install)
```
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https

curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg

curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list

sudo apt update
sudo apt install caddy

sudo systemctl start caddy

// edit caddy file
sudo nano /etc/caddy/Caddyfile

site:port {
    reverse_proxy address:internal_port
}

sudo systemctl reload caddy

```

# Docker
## Installation
```
// update list. If your output seems abnormal, take a moment to think on your next step. This is a guide that worked for me on Ubuntu 22.04.1 LTS
sudo apt update

// install prerequisites:
sudo apt install apt-transport-https ca-certificates curl software-properties-common

// add a GPG key for the official Docker repo:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

// Add docker repo to APT sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

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

## Docker: Portainer
```
docker run -d --restart always -p 8000:8000 -p 9443:9443 -v /var/run/docker.sock:/var/run/docker.sock --name portainer portainer/portainer-ce
```

### Docker Commands/Operations
```
// run docker container from docker-compose.yml in (-d) background
docker-compose up -d 

// list docker images
docker image ls 

// restart all containers
docker restart $(docker ps -q) 

// remove all containers
docker rm $(docker ps -aq) 

// run shell in docker
$ docker exec -it <container id> <bash or sh> 
root@<container id>:/#
// or as root:

// show logs output in docker container
docker logs <container-id>

// 
```

## Docker: Nginx Proxy Manager
Quick-Start (9.28.2022)
```
# use this as a docker-compose.yml file
version: '3'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
```
Then initiate your stack: `docker-compose up -d'

# Nginx
```
// enable autostart
sudo update-rc.d nginx defaults

// disable nginx from autostarting
sudo update-rc.d -f nginx disable
```

## Port Forwarding
- TCP/UDP: Connecting and holding to an endpoint/Sending a signal and hoping it arrives 
- dealing with busy port:
```
sudo netstat -nlptu | grep 80
sudo systemctl stop nginx
sudo systemctl stop apache
```

# Server Security
```
sudo ufw enable // make sure to enable the server firewall. 

sudo ufw reload // reload server firewall rules

sudo apt install unattended-upgrades // automatically install security updates

// using ssh keys to access your server (mostly for convenience)
// at local:
ssh-keygen -t ed25519

ssh-copy-id -i /<key directory> <user>@<ip>
(default: /home/<user>/.ssh/id_ed25519.pub)
// edit ssh settings on server
sudo nano /etc/ssh/sshd_config
systemctl restart sshd          // restart daemon

// create easier login @ .bashrc
sudo nano ~/.bashrc
// add "alias <name>="ssh -p <port> <user>@<ip address>"
source ~/.bashrc
```
## Fail2ban

```
// fail2ban SSH logins
sudo apt install fail2ban

// create sshd ban entry-- cp fail2ban.conf and enter at the bottom of /etc/fail2ban/fail2ban.local
[sshd]
enabled = true
port = <port>
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
bantime = -1

sudo service fail2ban restart // restart fail2ban

sudo fail2ban-client status

// to unban:
sudo fail2ban-client set sshd unbanip <ip>

// 2FA SSH w/ Google Authenticator
sudo apt install libpam-google-authenticator

sudo nano /etc/pam.d/sshd

sudo nano /etc/ssh/sshd_config

// edit sshd config, then restart
sudo service sshd restart

// to reverse, remove entries from files

// chkrootkit
git clone https://github.com/Magentron/chkrootkit.git   // clone from repo
cd chkrootkit                                           // cd into directory
./chkrootkit                                            // run chkrootkit

// rkhunter
wget http://downloads.sourceforge.net/project/rkhunter/rkhunter/1.4.6/rkhunter-1.4.6.tar.gz             // download package
tar -xvf rkhunter-1.4.6.tar.gz  // extract
rkhunter --check                // run tool
```

## Maldet: Linux Malware Detection
### Installation
```
// cd into a directory to unpack maldet files
wget https://www.rfxn.com/downloads/maldetect-current.tar.gz
tar -xvf maldetect-current.tar.gz
cd maldet-<version>
./install.sh

// update maldet
maldet -u

// edit maldet config
nano /usr/local/maldetect/conf.maldet
```
Make sure to have `clamav` installed so that maldet can utilize the clamav binary for the scanner engine.

`maldet --scan-all <directory>`: scan the entirety of a directory and subdirectories

`maldet -u`: update maldet
 

# Media
## Jellyfin
### Unlock locked user account
When the admin account is locked out and the Forgot Password feature is not working, you have to unlock the user manually. To do that, you need to find the `jellyfin.db` file on your system. The default location on Linux is: `/var/lib/jellyfin/data/`. For paths in other environments, see server paths.

Linux CLI
Before continuing, make sure that you have sqlite3 installed. When sqlite3 is not installed, you can install it under Debian based systems with apt install sqlite3. After that do the following commands/SQL query:
```
sqlite3 /PATH/TO/JELLYFIN/DB/jellyfin.db
```
```
UPDATE Users SET InvalidLoginAttemptCount = 0 WHERE Username = 'LockedUserName';
UPDATE Permissions SET Value = 0 WHERE Kind = 2 AND UserId IN (SELECT Id FROM Users WHERE Username = 'LockedUserName');
.exit
```

### SQLite3 Cheat Sheet
#### Basics
```
.tables --show tables
.quit
.help
.databases
.schema ${schema_name}
.system ls -l -- execute UNIX command
```
#### Managing databases
Attach another database to the current database connection:

```
ATTACH DATABASE file_name AS database_name;
```

Optimize the database:

```
VACUUM
```

Managing Tables
Create a new table:

```
CREATE TABLE [IF NOT EXISTS] table(
   primary_key INTEGER PRIMARY KEY,
   column_name type NOT NULL,
   column_name type NULL,
   ...
);
```

Rename a table:

```
ALTER TABLE table_name RENAME TO new_name;
```

Add a new column to a table:

```
ALTER TABLE table ADD COLUMN column_definition;
```

Drop an existing column in a table:

```
ALTER TABLE table DROP COLUMN column_name;
```

Drop a table and its data:

```
DROP TABLE [IF EXISTS] table_name;
```

#### Managing indexes
Creating an index

```
CREATE [UNIQUE] INDEX index_name
ON table_name (c1,c2,...)
```

Delete an index:

```
DROP INDEX index_name;
```

Create an expression index:

```
CREATE INDEX index_name ON table_name(expression);
```

#### Querying Data
Query all data from a table

```
SELECT * FROM table_name;
```

Query data from the specified column of a table:

```
SELECT c1, c2
FROM table_name;
```

Query unique rows

```
SELECT DISTINCT (c1)
FROM table_name;
```

Query rows that match a condition using a WHERE clause.

```
SELECT *
FROM table_name
WHERE condition;
```

Rename column in the query’s output:

```
SELECT c1 AS new_name
FROM table_name;
```

Query data from multiple tables using inner join, left join

```
SELECT * 
FROM table_name_1
INNER JOIN table_name_2 ON condition;
```

```
SELECT * 
FROM table_name_1
LEFT JOIN table_name_2 ON condition;
```

Count rows returned by a query:

```
SELECT COUNT (*)
FROM table_name;
```

Sort rows using ORDER BY clause:

```
SELECT c1, c2
FROM table_name
ORDER BY c1 ASC [DESC], c2 ASC [DESC],...;
```

Group rows using GROUP BY clause.

```
SELECT *
FROM table_name
GROUP BY c1, c2, ...;
```

Filter group of rows using HAVING clause.

```
SELECT c1, aggregate(c2)
FROM table_name
GROUP BY c1
HAVING condition;
```

#### Changing Data
Insert a row into a table:

```
INSERT INTO table_name(column1,column2,...)
VALUES(value_1,value_2,...);
```

Insert multiple rows into a table in a single statement:

```
INSERT INTO table_name(column1,column2,...)
VALUES(value_1,value_2,...),
      (value_1,value_2,...),
      (value_1,value_2,...)...
      ```

Update all rows in a table:

```
UPDATE table_name
SET c1 = v1,
    ...
    ```

Update rows that match with a condition:

```
UPDATE table_name
SET c1 = v1,
    ...
WHERE condition;
```

Delete all rows in a table

```
DELETE FROM table;
```

Delete rows specified by a condition:
```
DELETE FROM table
WHERE condition;
```

Search
Search using LIKE operator:
```
SELECT * FROM table
WHERE column LIKE '%value%'
```
Search using full-text search:
```
SELECT * 
FROM table
WHERE table MATCH 'search_query';
```
### Installing Jellyfin (Docker) 
https://jellyfin.org/docs/general/administration/installing.html
### Transcoding

To properly change track order of an `.mkv`:
```
mkvmerge --output "your_file (1).mkv" "(" "your_file.mkv" ")" --track-order 0:0,0:2,0:1

# first, get audio track info so we know which one to keep
mkvmerge -i input.mkv
File 'input.mkv': container: Matroska
Track ID 1: video (V_MPEG4/ISO/AVC)
Track ID 2: audio (A_AAC)
Track ID 3: audio (A_AAC)        <----------- for example, let's keep this one
Track ID 4: audio (A_AAC)

mkvmerge -o output.mkv --audio-tracks 3 input.mkv
```

### Converting mkv to h264 with FFmpeg

EDIT: This question has become very popular and is one of the top results for searching "convert mkv to h264 ffmpeg" and thus I feel it is appropriate to add that for anyone stumbling upon this question to rather use
```
ffmpeg -i input.mkv -c:v libx264 -c:a aac output.mp4

// 10-bit/12-bit HEVC to 10-bit H.264

ffmpeg -i input -map 0 -c:v libx264 -crf 18 -c:a copy output.mk
```
[link](https://stackoverflow.com/questions/30898671/converting-mkv-to-h264-ffmpeg)

### HEVC x265 to MP4 x264
`ffmpeg -i input.mp4 -c:v libx264 -crf 20 -c:a copy output.mp4`

10-bit/12-bit HEVC to 8-bit H.264

`ffmpeg -i input -map 0 -c:v libx264 -crf 18 -vf format=yuv420p -c:a copy output.mkv`

    -map 0 will include all streams (default stream selection only selects 1 stream per type). See FFmpeg Wiki: Map.

    Adjust the -crf value to provide the desired level of quality. Add the -preset option if you want to adjust encoding speed. See FFmpeg Wiki: H.264 for more info on -crf and -preset.

    Uses the format filter to choose the yuv420p pixel format to create 8-bit output.

10-bit/12-bit HEVC to 10-bit H.264

`ffmpeg -i input -map 0 -c:v libx264 -crf 18 -c:a copy output.mkv`

    -map 0 will include all streams (default stream selection only selects 1 stream per type). See FFmpeg Wiki: Map.

    Adjust the -crf value to provide the desired level of quality. Add the -preset option if you want to adjust encoding speed. See FFmpeg Wiki: H.264 for more info on -crf and -preset.

    No need for the format filter in this case.

10-bit/12-bit HEVC to 8-bit HEVC

`ffmpeg -i input -map 0 -c:v libx265 -crf 20 -vf format=yuv420p -c:a copy output.mkv`

    -map 0 will include all streams (default stream selection only selects 1 stream per type). See FFmpeg Wiki: Map.

    Adjust the -crf value to provide the desired level of quality. Add the -preset option if you want to adjust encoding speed. See FFmpeg Wiki: HEVC / H.265 for more info on -crf and -preset.

    Uses the format filter to choose the yuv420p pixel format to create 8-bit output.

12-bit HEVC to 10-bit HEVC

`ffmpeg -i input -map 0 -c:v libx265 -crf 20 -vf format=yuv420p10le -c:a copy output.mkv`

    -map 0 will include all streams (default stream selection only selects 1 stream per type). See FFmpeg Wiki: Map.

    Adjust the -crf value to provide the desired level of quality. Add the -preset option if you want to adjust encoding speed. See FFmpeg Wiki: HEVC / H.265 for more info on -crf and -preset.

    Uses the format filter to choose the yuv420p10le pixel format to create 10-bit output. Other 10-bit pixel formats supported by libx265 are yuv422p10le & yuv444p10le, but your player may not like these. See ffmpeg -h encoder=libx265 for additional supported pixel formats.

```
# assume input.mkv has 3 subtitle tracks
# remove subtitle track 2 (copy 1&3) from input.mkv & save to output.mkv
mkvmerge -o output.mkv --subtitle-tracks 1,3 input.mkv

# remove all subtitles (copy none)
mkvmerge -o output.mkv --no-subtitles input.mkv
```
