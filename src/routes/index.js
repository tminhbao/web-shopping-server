const homeRouter = require("./home");
const orderRouter = require("./order");
const productRouter = require("./product");
const reportRouter = require("./report");
const usersRouter = require("./users");
const signinRouter = require("./signin");
const signupRouter = require("./signup");
const logoutRouter = require("./logout");
const accountRouter = require("./account");
const accoutListRouter = require("./accountlist");
const userListRouter = require("./userlist");
const editInfoRouter = require("./editinfo");
const userInfoRouter = require("./userinfo");

function route(app) {
  app.use("/signin", signinRouter);
  app.use("/signup", signupRouter);
  app.use("/order", orderRouter);
  app.use("/product", productRouter);
  app.use("/report", reportRouter);
  app.use("/user", usersRouter);
  app.post("/logout", logoutRouter);
  app.use("/account", accountRouter);
  app.use("/accountlist", accoutListRouter);
  app.use("/editinfo", editInfoRouter);
  app.use("/userlist", userListRouter);
  app.use("/userinfo", userInfoRouter);
  app.use("/", homeRouter);
}
module.exports = route;
