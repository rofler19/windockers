#do not run containers from ISE. it HANGS!
# run an interactive container and save a file. then exit the container image:

docker run -it mcr.microsoft.com/windows/nanoserver:ltsc2022 cmd
echo "hello world!" > c:\Users\Public\Hello.txt
exit

#view the new container image
docker ps -a

#save the changes in the container image to new image "newdockertoy1"
docker commit 51515705f208 newdockertoy1

#view the new image
docker images

#run the new image in a container, print the contents of hello.txt to the screen.
docker run newdockertoy1 cmd.exe /s /c type c:\Users\Public\Hello.