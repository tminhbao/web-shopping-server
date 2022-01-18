const db = require("../database/connect");
const executeQuery = (query) => {
  return new Promise((res, rej) => {
    db.query(query, (err, result) => {
      if (err) rej(err);
      else res(result);
    });
  });
};

const getCheckoutDelivered = async () => {
  const sql = `SELECT * FROM checkout WHERE state = 'delivered'`;
  const listCheckout = await executeQuery(sql);
  return listCheckout;
};

const getCheckoutDelivering = async () => {
  const sql = `SELECT * FROM checkout WHERE state = 'delivering'`;
  const listCheckout = await executeQuery(sql);
  return listCheckout;
};

module.exports = { getCheckoutDelivered, getCheckoutDelivering };
