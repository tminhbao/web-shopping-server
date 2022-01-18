const db = require("../database/connect");
const executeQuery = (query) => {
  return new Promise((res, rej) => {
    db.query(query, (err, result) => {
      if (err) rej(err);
      else res(result);
    });
  });
};

const getCheckout = async () => {
  const sql = `SELECT * FROM checkout`;
  const listCheckout = await executeQuery(sql);
  return listCheckout;
};

module.exports = { getCheckout };
