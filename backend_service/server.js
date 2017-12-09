'use strict';

const PORT = 8080;
const HOST = '0.0.0.0';

const express = require('express');

const app = express();
app.get('/', (req, res) => {
  res.header('Access-Control-Allow-Origin', '*'); 
  res.send('Hello world\n');
});

app.listen(PORT, HOST);
console.log(`Backend service is running on http://${HOST}:${PORT}`);
