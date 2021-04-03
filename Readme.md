# .NetCore-Docker

## Install .netcore SDK from https://dotnet.microsoft.com/download

### Create new web-api
```shell
dotnet new webapi -o <destication> -n <namespace> --no-https
```

### Build app
```shell
dotnet build -c Release
```
Build file will be in `bin/Release/net5.0/`

### Publish app
```shell
dotnet publish -c Release
```
Publish file will be in `bin/Release/net5.0/publish/`

### Build to docker image
```shell
docker build -t dotnetcore-docker -f Dockerfile .
```

### Start docker container
```shell
docker run -p 8080:8080 --name dotnetcore-docker  -d dotnetcore-docker
```

Open link avialable below in browser when start container
- http://localhost:8080/swagger/index.html
- http://localhost:8080/WeatherForecast