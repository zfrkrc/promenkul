git pull
docker build . -t pro
docker rm pro -f
docker run -d -p 80:80 --name pro pro