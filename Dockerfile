FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine as builder
USER root
WORKDIR /opt/dotnetcore-docker
COPY . ./

RUN ["dotnet", "publish", "-c", "Release"]

FROM mcr.microsoft.com/dotnet/aspnet:5.0

# Add dotnet core env for enable swagger 
ENV ASPNETCORE_ENVIRONMENT=Development

USER root

# RUN apt-get update && apt-get upgrade
# RUN apt install -y curl
# RUN apt install -y lsof

WORKDIR /opt/dotnetcore-docker/publish

EXPOSE 8080

COPY --from=builder /opt/dotnetcore-docker/bin/Release/net5.0/publish .
ENTRYPOINT ["dotnet", "dotnetcore-docker.dll"]
