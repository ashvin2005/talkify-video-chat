const server = import.meta.env.VITE_SERVER_URL || 
  (import.meta.env.PROD
    ? "https://your-production-server.com"
    : "http://localhost:8000");

export default server;
