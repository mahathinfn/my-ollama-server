FROM ollama/ollama:latest

EXPOSE 11434
ENV OLLAMA_HOST=0.0.0.0:11434

# Auto-pull models on startup
RUN echo '#!/bin/bash\n\
echo "Starting Ollama server..."\n\
ollama serve &\n\
sleep 20\n\
echo "Pulling models..."\n\
ollama pull mistral || echo "Failed to pull mistral"\n\
ollama pull llama2 || echo "Failed to pull llama2"\n\
echo "Setup complete"\n\
wait' > /start.sh && chmod +x /start.sh

CMD ["/start.sh"]
