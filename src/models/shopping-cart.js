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

const getTop10Product = async () => {
  const sql = `SELECT laptop.*,model.model_name,SUM(quantity) as quantityProduct, CONCAT_WS(" ", manufacture.manufacture_name, model.model_name, laptop.laptop_name) as name FROM shoppingcartdb,laptop,manufacture,model WHERE shoppingcartdb.laptop_id = laptop.laptop_id AND laptop.manufacture = manufacture.manufacture_id AND laptop.model = model.model_id GROUP BY laptop_id ORDER BY quantityProduct DESC LIMIT 10 `;
  const list = await executeQuery(sql);
  return list;
};

module.exports = {
  getCheckoutDelivered,
  getCheckoutDelivering,
  updateCheckout,
  getTop10Product,
};
