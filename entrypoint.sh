#!/bin/bash
echo "Starting Ollama server..."
ollama serve &
SERVER_PID=$!

# Wait for the local server to be responsive
until curl -s http://localhost:11434 > /dev/null; do
  echo "Waiting for Ollama server API..."
  sleep 1
done
echo "Ollama server is up. Pulling models..."

ollama pull llama3

echo "Models pulled. Keeping server alive."
wait $SERVER_PID
