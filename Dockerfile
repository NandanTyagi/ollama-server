FROM ubuntu:20.04

RUN apt-get update && apt-get install -y curl

# Install Ollama
RUN curl -L https://ollama.ai/install.sh | bash

# Expose port 11434
EXPOSE 11434

# Start the Ollama server
CMD ["ollama", "serve"]
