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

// Set route 
const route = require('./src/routes/index');
route(app);

// app.get('/admin', (req, res) => {
//   res.render('admin/signin')
// })


app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})

