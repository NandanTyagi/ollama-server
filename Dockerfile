# Use the official Ubuntu 22.04 base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    OLLAMA_ADDRESS=0.0.0.0:11434

# Update package lists, install dependencies, and install Ollama
RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    rm -rf /var/lib/apt/lists/* && \
    curl -L https://ollama.ai/install.sh | bash

# Expose port 11434 for the Ollama server
EXPOSE 11434

# Start the Ollama server when the container launches
CMD ["ollama", "serve"]

