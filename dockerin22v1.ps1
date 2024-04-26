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