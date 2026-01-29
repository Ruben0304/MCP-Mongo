FROM node:20-slim
WORKDIR /app

RUN npm install -g supergateway @mongodb-js/mongodb-mcp-server

EXPOSE 3000

CMD ["sh", "-c", "supergateway --stdio \"mongodb-mcp-server --connectionString ${MCP_MONGODB_URI}\" --port ${PORT:-3000} --healthEndpoint /health"]
