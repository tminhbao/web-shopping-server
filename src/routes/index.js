const homeRouter = require('./home');
const adminRouter = require('./admin');
const orderRouter = require('./order');
const productRouter = require('./product');
const reportRouter = require('./report');
const usersRouter = require('./users');

function route(app) {
    app.use('/admin',adminRouter);
    app.use('/order',orderRouter);
    app.use('/product',productRouter);
    app.use('/report',reportRouter);
    app.use('/user',usersRouter);
    app.use('/',homeRouter);
}
module.exports = route;
