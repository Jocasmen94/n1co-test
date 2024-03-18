# Use a multi-stage build for a slimmer image
FROM python:3.9-slim AS base-python

WORKDIR /app

# Install Python dependencies with a vulnerable library
COPY requirements.txt ./  # Replace with your requirements file name if different
RUN pip install -r requirements.txt

# Introduce a security vulnerability by using an outdated or vulnerable library
# For demonstration purposes, let's use an outdated version of a library
# RUN pip install outdated-vulnerable-library==1.2.3

# Create a new stage based on the python image
FROM node:14

# Copy package.json and package-lock.json (if applicable)
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Set the working directory for the application
WORKDIR /app

# Define the startup command
CMD ["node", "app.js"]

