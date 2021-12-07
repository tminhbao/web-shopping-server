const ProductModel = require('../models/product');

class ProductController {
    index = async (req, res) => {
        let {listPro,page,totalPage} = await ProductModel.getList(req.query.page || 0, req.query.name);
        res.render('product/index',{listPro:listPro,page,totalPage});
    }

    add_get = async (req, res) => {
        res.render('product/add')
    }

    add_post = async (req, res) => {
        const data = {
            laptop_id:req.body.laptop_id,
            manufacture:req.body.manufacture,
            model:req.body.model,
            laptop_name:req.body.laptop_name,
            laptop_cpu:req.body.cpu,
            laptop_vga:req.body.vga,
            laptop_ram:(req.body.ram_size + ' ' + req.body.ram_type + ' ' + req.body.ram_bus),
            laptop_disk:(req.body.disk_type + ' ' + req.body.disk_size),
            cost:Number(req.body.cost),
            price:Number(req.body.price),
            inventory:Number(req.body.inventory),
            image:req.body.laptop_img
        }

        await ProductModel.add(data);
        res.redirect('/');
    }


    delete = async (req,res) => {
        let listPro = await ProductModel.getList();
        res.render('product/delete',{listPro:listPro});
    }

    delete_get = async (req, res, next) => {
        const id = req.params['id'];
        console.log(id);
        await ProductModel.delete(id);
        res.redirect('../delete');
};
}
module.exports = new ProductController;