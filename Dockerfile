# ---------- Build Stage ----------
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy only csproj files and restore dependencies first (better layer caching)
COPY **/*.csproj ./
RUN for file in *.csproj; do dotnet restore "$file"; done

# Copy remaining source and build the app
COPY . .
RUN dotnet publish -c Release -o /app/publish /p:UseAppHost=false

# ---------- Runtime Stage ----------
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "dotnethelloworld.dll"]
