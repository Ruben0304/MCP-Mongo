FROM node:20-slim

WORKDIR /app

# Instalar dependencias
RUN npm install -g supergateway @mongodb-js/mongodb-mcp-server

# Exponer puerto
EXPOSE 3000

# Comando de inicio
CMD ["sh", "-c", "supergateway --stdio 'npx @mongodb-js/mongodb-mcp-server' --port ${PORT:-3000}"]
