const express = require('express')
const app = express()
const port = 3000

// Handlebars 
const handlebars = require('express-handlebars');
const hbs = handlebars.create({ extname: '.hbs' });
app.engine('hbs', hbs.engine);
app.set('view engine', 'hbs');
// Path
const path = require('path');
app.set("views", path.join(__dirname, 'src/views'));

// Set static 
app.use(express.static('src/public'));

app.use(express.urlencoded());
app.use(express.json());



const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const session = require("express-session");
const connectFlash = require("connect-flash");
const passport = require("passport");

app.use(cookieParser('secret'));
app.use(session({
  secret: 'secret',
  resave: true,
  saveUninitialized: false,
  cookie: {
      maxAge: 1000 * 60 * 60 * 24 // 86400000 1 day
  }
}));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


//Enable flash message
app.use(connectFlash());

//Config passport middleware
app.use(passport.initialize());
app.use(passport.session());

// Set route 
const route = require('./src/routes/index');




route(app);


app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})

