FROM node:20-slim
WORKDIR /app

RUN npm install -g supergateway @mongodb-js/mongodb-mcp-server

# Railway inyecta PORT; EXPOSE es solo informativo
EXPOSE 3000

CMD ["sh", "-c", "supergateway --stdio \"mongodb-mcp-server --connectionString ${MCP_MONGODB_URI}\" --outputTransport streamableHttp --port ${PORT:-3000} --streamableHttpPath /mcp --healthEndpoint /health"]
