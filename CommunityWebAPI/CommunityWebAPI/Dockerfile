FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["CommunityWebAPI/CommunityWebAPI.csproj", "CommunityWebAPI/"]
RUN dotnet restore "CommunityWebAPI/CommunityWebAPI.csproj"
COPY . .
WORKDIR "/src/CommunityWebAPI"
RUN dotnet build "CommunityWebAPI.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CommunityWebAPI.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CommunityWebAPI.dll"]
