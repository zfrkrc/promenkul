git pull
docker ps -a
docker rm pro

docker image rm pro nginx -f
docker build . -t pro
docker run -d -p 80:80 --name pro pro