# Use a multi-stage build for a slimmer image
FROM python:3.9-slim AS base-python

WORKDIR /app

# Install Python dependencies
COPY requirements.txt ./  # Replace with your requirements file name if different
RUN pip install -r requirements.txt

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

