const express = require('express');
const mongoose = require('mongoose');
const mysql = require('mysql');

const app = express();
const port = 3000;

const config = require('./config');

// MongoDB Connection
mongoose.connect(config.mongodb.connectionString, { useNewUrlParser: true, useUnifiedTopology: true });
const mongoDB = mongoose.connection;
mongoDB.on('error', console.error.bind(console, 'MongoDB connection error:'));

// MySQL Connection
const mysqlConnection = mysql.createConnection(config.mysql);
mysqlConnection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
  } else {
    console.log('Connected to MySQL');
  }
});

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
