const db = require("../database/connect");
const executeQuery = (query) => {
  return new Promise((res, rej) => {
    db.query(query, (err, result) => {
      if (err) rej(err);
      else res(result);
    });
  });
};

const updateCheckout = async (user_id) => {
  const sql = `UPDATE checkout SET state = 'delivered' WHERE user_id = ${user_id}`;
  const listUpdate = await executeQuery(sql);
  console.log(listUpdate);
  return listUpdate;
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

module.exports = {
  getCheckoutDelivered,
  getCheckoutDelivering,
  updateCheckout,
};
