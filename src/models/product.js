const db = require('../database/connect');
var laptopList = [];
const ITEM_PER_PAGE = 10;

const executeQuery = (query) => {
    return new Promise((res, rej) => {
        db.query(query, (err, result) => {
            if (err) rej(err)
            else res(result);
        })
    })
}

const getList = async (page, laptop_id) => {
    const offset = (page || 1 - 1) * ITEM_PER_PAGE;
    if (!laptop_id) {
        const sqlPaginate = `SELECT * FROM laptop LIMIT ${ITEM_PER_PAGE} OFFSET ${offset};`;
        const sqlTotalItem = `SELECT COUNT(*) AS totalItem FROM laptop`
        const [listItem, totalItem] = await Promise.all([executeQuery(sqlPaginate), executeQuery(sqlTotalItem)])
        const totalPage = Math.ceil((totalItem[0].totalItem || 0) / ITEM_PER_PAGE);
        return { listItem, totalPage, page };
    }
    else {
        const sqlPaginate = `SELECT * FROM laptop WHERE laptop_id = '${laptop_id}' LIMIT ${ITEM_PER_PAGE} OFFSET ${offset}`
        const sqlTotalItem = `SELECT COUNT(*) AS totalItem FROM laptop WHERE laptop_id = '${laptop_id}'`
        const [listItem, totalItem] = await Promise.all([executeQuery(sqlPaginate), executeQuery(sqlTotalItem)])
        const totalPage = Math.ceil((totalItem[0].totalItem || 0) / ITEM_PER_PAGE);
        return { listItem, totalPage, page }
    }
}

exports.add = (data) => {
    var values = [
        [data.laptop_id, data.manufacture, data.model, data.laptop_name, '', data.laptop_cpu, data.laptop_ram, data.laptop_vga, data.laptop_disk, data.image, data.cost, data.price, data.inventory]
    ]

    let insert_laptop_sql = 'INSERT INTO laptop(laptop_id, manufacture, model, laptop_name, laptop_description, laptop_cpu, laptop_ram, laptop_vga, laptop_disk, image, cost, price, inventory) VALUES ?'
    let query = db.query(insert_laptop_sql, [values], (err, result) => {
        if (err) throw err;
        console.log("Number of records inserted: " + result.affectedRows);
    })
}

exports.delete = (id) => {
    let delete_laptop_sql = 'DELETE FROM laptop WHERE laptop_id = ?';
    let query = db.query(delete_laptop_sql, id, (err, result) => {
        if (err) throw err;
        console.log("Number of records deleted: " + result.affectedRows);
    })
}

module.exports = { getList }