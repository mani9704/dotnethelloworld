# ---------- Build Stage ----------
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy solution and project files first for dependency restore
COPY HelloMinimal.sln ./
COPY HelloApi/HelloApi.csproj HelloApi/
RUN dotnet restore "HelloApi/HelloApi.csproj"

# Copy everything else and publish
COPY . .
RUN dotnet publish "HelloApi/HelloApi.csproj" -c Release -o /app/publish /p:UseAppHost=false

# ---------- Runtime Stage ----------
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "HelloApi.dll"]
