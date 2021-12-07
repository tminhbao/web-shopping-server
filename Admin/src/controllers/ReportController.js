class ReportController {
    index(req,res) {
        res.render('report/top')
    }
}
module.exports = new ReportController;