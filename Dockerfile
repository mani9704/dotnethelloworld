# Stage 1: Build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the project file(s) and restore dependencies
COPY **/*.csproj ./
RUN for file in *.csproj; do dotnet restore "$file"; done

# Copy the rest of the source code
COPY . .

# Build the application
RUN dotnet publish -c Release -o /app/publish

# Stage 2: Run the app
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "dotnethelloworld.dll"]
