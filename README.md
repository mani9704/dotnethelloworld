# Azure DevOps Engineer Assignment

## Scenario

You are tasked with setting up CI/CD in Azure DevOps for a simple .NET 9 Hello World Web API application that lives in this repository. 
You must provision Azure infrastructure and deploy this app to Azure App Service using IaC (Choice of language is yours but not Azure ARM templates).

The goal is to demonstrate your ability to:
- Build a .NET 9 application.
- Use Infrastructure as Code (IaC) to provision cloud resources.
- Deploy the application to Azure App Service using an Azure DevOps pipeline.

---

## Application Repo

This repository contains a simple .NET 9 Web API that returns "Hello World" at the root endpoint. You will use this app for your CI/CD pipeline.
---

## Tasks (What you must deliver)

1) Infrastructure as Code (IaC)
- Author Bicep or Terraform or any other language but not ARM templates to provision:
  - A Resource Group (if not provided).
  - An Azure App Service Plan (Linux; Free F1 or Basic B1).
  - An Azure Web App (Linux) configured for .NET 9.

2) Build Pipeline (CI) — Azure DevOps YAML
- Create azure-pipelines.yml at the repo root that:
  - Triggers on pushes and PRs to main.
  - Restores dependencies.
  - Builds the .NET 9 project in Release.
  - Publishes a deployable build artifact (e.g., zipped folder or publish output).

3) Release Pipeline (CD)
- In the same YAML (multi-stage) or a following stage:
  - Deploy the build artifact to the App Service created by your IaC.
  - Use an Azure Resource Manager service connection (created in Azure DevOps).
  - Use Azure Web App Deploy (zip deploy) or az webapp deploy.

4) Documentation (Update this README)
- Document:
  - How to deploy your IaC (exact commands you used).
  - How your pipeline is structured (stages and key tasks).
  - The URL of your deployed app.

---



## What to Submit

- Repository containing:
  - IaC code (Bicep or Terraform or other).
  - azure-pipelines.yml at the repo root.
  - Working app service URL after deployment.

---
