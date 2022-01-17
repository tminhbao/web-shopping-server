const db = require("../database/connect");
const ITEM_PER_PAGE = 10;

const executeQuery = (query) => {
  return new Promise((res, rej) => {
    db.query(query, (err, result) => {
      if (err) rej(err);
      else res(result);
    });
  });
};

const getListAdmin = async (page) => {
  const offset = (page - 1 || 1 - 1) * ITEM_PER_PAGE;
  const sqlPaginate = `SELECT * FROM admins LIMIT ${ITEM_PER_PAGE} OFFSET ${offset}`;
  const sqlTotalItem = `SELECT COUNT(*) AS totalItem FROM admins`;
  const [listItem, totalItem] = await Promise.all([
    executeQuery(sqlPaginate),
    executeQuery(sqlTotalItem),
  ]);
  const totalPage = Math.ceil((totalItem[0].totalItem || 0) / ITEM_PER_PAGE);
  return { listItem, totalPage, page };
};

const getListUser = async (page) => {
  const offset = (page - 1 || 1 - 1) * ITEM_PER_PAGE;
  const sqlPaginate = `SELECT * FROM users LIMIT ${ITEM_PER_PAGE} OFFSET ${offset}`;
  const sqlTotalItem = `SELECT COUNT(*) AS totalItem FROM users`;
  const [listItem, totalItem] = await Promise.all([
    executeQuery(sqlPaginate),
    executeQuery(sqlTotalItem),
  ]);
  const totalPage = Math.ceil((totalItem[0].totalItem || 0) / ITEM_PER_PAGE);
  return { listItem, totalPage, page };
};

const getUserByID = async (id) => {
  const sqlUserInfo = `SELECT * FROM users WHERE id = '${id}'`;
  const userInfo = await executeQuery(sqlUserInfo);
  return userInfo;
};

module.exports = { getListAdmin, getListUser, getUserByID };
