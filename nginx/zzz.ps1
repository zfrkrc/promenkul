git pull
docker ps -a
docker build . -t pro
docker rm pro -f
docker run -d -p 80:80 --name pro pro
docker image prune -f
clear
echo "Servis"
docker ps -a
echo "Diskler"
docker image ls -a
echo "TAMAM MI??"