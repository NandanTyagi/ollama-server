# Use the official Ubuntu 20.04 base image
FROM ubuntu:20.04

# Set environment variables to prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install dependencies
RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install Ollama
RUN curl -L https://ollama.ai/install.sh | bash

# Expose port 11434 for the Ollama server
EXPOSE 11434

# Set OLLAMA_HOST to listen on all network interfaces
ENV OLLAMA_HOST=http://0.0.0.0:11434


# Start the Ollama server when the container launches
CMD ["ollama", "serve"]
