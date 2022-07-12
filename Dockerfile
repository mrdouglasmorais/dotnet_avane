FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app

COPY HelloWord.Dotnet.sln ./
COPY ./src ./src
RUN dotnet restore HelloWord.Dotnet.sln
RUN dotnet publish -c Release ./src/HelloWord.Dotnet.Api/HelloWord.Dotnet.Api.csproj -o /app/publish


FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build-env app/publish .

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENTRYPOINT ["dotnet", "HelloWord.Dotnet.Api.dll"]