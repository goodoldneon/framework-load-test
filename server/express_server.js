const express = require("express");

const app = express();
const host = "0.0.0.0";
const port = 8080;

app.get("/", (req, res) => {
  res.send("Hello from Express!");
});

app.listen(port, host, () => {
  console.log(`Listening at http://${host}:${port}`);
});

process.on("SIGINT", () => {
  process.exit(0);
});
