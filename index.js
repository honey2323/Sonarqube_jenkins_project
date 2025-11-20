const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// Default route
app.get('/', (req, res) => {
  res.send('Hello, Abhishek! This is your Node.js app!');
});

app.listen(port, () => {
  console.log(`App is running on http://localhost:${port}`);
});
