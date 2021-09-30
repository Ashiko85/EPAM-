CONTENTS OF THIS FILE
---------------------

 * Introduction
 * Requirements
 * Installation
 * Configuration


INTRODUCTION
------------

This software comes with absolutely no warranty!!! ;)
Purpose of this software is to run python application that counts number of visits on a page under Docker container. Number of visits is stored on Redis database running on second container.


REQUIREMENTS
------------

To be able to run this software, you'll need to have Linux OS with installed Docker.io and docker-compose in version >= 3.7.


INSTALLATION
------------

To install this software, simply copy whole content of "task5" folder to your designated location (ie. "/opt/containers/container1/"), then run containers:

$cd /opt/containers/container1/
$sudo docker-compose up


CONFIGURATION
-------------

Software is already fully configured for usage - after running "docker-compose up" command, it will automatically set up whole environment automatically based on docker-compose.yml, Dcoker and requirements.txt files.


USAGE
------

When containers are up and running, simply go to "http://172.19.0.2:8000/visitor" in your favourite browser and start pressing F5 button like creazy to see incremented visit counter ;)
You can also reset counter if you are in a mood by visiting "http://172.19.0.2:8000/visitor/reset" page! Belive it or not, it is soooo much fun! ;)
