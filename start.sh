#!/bin/bash

echo "🔮 QueryCraft - Starting Application..."
echo ""

# Check if .env file exists
if [ ! -f .env ]; then
    echo "⚠️  .env file not found!"
    echo "Creating .env from .env.example..."
    cp .env.example .env
    echo ""
    echo "⚠️  IMPORTANT: Please edit .env and add your GROQ_API_KEY"
    echo "Get your API key from: https://console.groq.com"
    echo ""
    read -p "Press Enter after adding your API key to .env..."
fi

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker first."
    exit 1
fi

# Create necessary directories
mkdir -p logs uploads data

echo "✅ Docker is running"
echo ""
echo "🚀 Starting QueryCraft with Docker Compose..."
echo ""

# Start Docker Compose
docker-compose up --build

echo ""
echo "🛑 QueryCraft stopped"