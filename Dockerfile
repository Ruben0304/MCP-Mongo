# Usa base oficial de Node 20 como en tu versión
FROM node:20-slim

WORKDIR /app

# Instala MCP server globalmente
RUN npm install -g supergateway @mongodb-js/mongodb-mcp-server

# Asegúrate de exponer el PORT dinámico
# Ayuda a documentar cuál es el puerto principal
EXPOSE ${PORT:-3000}

# El proceso principal escucha en el $PORT
CMD ["sh", "-c", \
  "supergateway --stdio \"mongodb-mcp-server --connectionString ${MCP_MONGODB_URI}\" --port ${PORT:-3000} --healthEndpoint /health"]
