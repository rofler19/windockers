#set-executionPolicy remotesigned
#Install-Module -name DockerMsftProvider -Repository PSgallery -Force
#Install-Package -Name docker -ProviderName DockerMsftProvider -verbose
#Docker info
#Get-service docker
#Get-Package -name Docker -ProviderName DockerMsftProvider
#PUll a container
#docker pull mcr.microsoft.com/windows/nanoserver:ltsc2022
docker pull mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2022

#view docker
#docker image ls

#docker --help
#export docker file:
#docker save -o c:\w22iis mcr.microsoft.com/windows/servercore/iis

#import docker file:
#docker load -i c:\whatever.tar 

14/12/2022

windowsservercore-ltsc2022 docker pull mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2022
windowsservercore-ltsc2019 docker pull mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019


#1.Create a Dockerfile with your website

FROM mcr.microsoft.com/windows/servercore/iis

RUN powershell -NoProfile -Command Remove-Item -Recurse C:\inetpub\wwwroot\*

WORKDIR /inetpub/wwwroot

COPY content/ .



#2.You can then build and run the Docker image:
$ docker build -t iis-site .
$ docker run -d -p 8000:80 --name my-running-site iis-site

#Verify in the browser
With the current release, you can't use http://localhost to browse your site from the container host. 
This is because of a known behavior in WinNAT, and will be resolved in future. Until that is addressed, 
you need to use the IP address of the container.
Once the container starts, you'll need to finds its IP address so that you can connect
to your running container from a browser. 

docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" my-running-site

You will see an output similar to this:

172.28.103.186