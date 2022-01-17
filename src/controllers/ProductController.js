const ProductModel = require("../models/product");

class ProductController {
  index = async (req, res) => {
    const { listItem, page, totalPage } = await ProductModel.getList(
      req.query.page || 1,
      req.query.name
    );
    const listPage = [];
    for (let i = 0; i < totalPage; i++) {
      listPage.push(i + 1);
    }
    res.render("product", {
      listPro: listItem,
      listPage,
      page,
      user: req.user,
    });
  };

  add_get = async (req, res) => {
    res.render("product/add");
  };

  add_post = async (req, res) => {
    const data = {
      laptop_id: req.body.laptop_id,
      manufacture: req.body.manufacture,
      model: req.body.model,
      laptop_name: req.body.laptop_name,
      laptop_cpu: req.body.cpu,
      laptop_vga: req.body.vga,
      laptop_ram:
        req.body.ram_size + " " + req.body.ram_type + " " + req.body.ram_bus,
      laptop_disk: req.body.disk_type + " " + req.body.disk_size,
      cost: Number(req.body.cost),
      price: Number(req.body.price),
      inventory: Number(req.body.inventory),
      image: req.body.laptop_img,
    };

    await ProductModel.add(data);
    res.redirect("/");
  };

  delete = async (req, res) => {
    const { listItem, page, totalPage } = await ProductModel.getList(
      req.query.page || 1,
      req.query.name
    );
    const listPage = [];
    for (let i = 0; i < totalPage; i++) {
      listPage.push(i + 1);
    }
    res.render("product/delete", {
      listPro: listItem,
      listPage,
      page,
      user: req.user,
    });
  };

  delete_get = async (req, res, next) => {
    const id = req.params["id"];
    console.log(id);
    await ProductModel.remove(id);
    res.redirect("../delete");
  };

  edit = async (req, res) => {
    const { listItem, page, totalPage } = await ProductModel.getList(
      req.query.page || 1,
      req.query.name
    );
    const listPage = [];
    for (let i = 0; i < totalPage; i++) {
      listPage.push(i + 1);
    }
    res.render("product/edit", {
      listPro: listItem,
      listPage,
      page,
      user: req.user,
    });
  };

  edit_id = async (req, res) => {
    const id = req.params["id"];
    console.log(id);
    const laptopById = await ProductModel.getLaptopById(id);
    res.render("product/edit_id", { listPro: laptopById });
  };
}
module.exports = new ProductController();
