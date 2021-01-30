const homeModel = require('../models/homeModel')

module.exports = {
    getBalance: (req, res) => {
        const { id } = req.params
        homeModel.getBalance(id)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    getBalanceIn: (req, res) => {
        const { id } = req.params
        homeModel.getBalanceIn(id)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    getBalanceOut: (req, res) => {
        const { id } = req.params
        homeModel.getBalanceOut(id)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    getAllTranfer: (req, res) => {
        const { id } = req.params
        Promise.all([
            homeModel.getBalanceIn(id),
            homeModel.getBalanceOut(id)
        ]).then((result) => {
            let newTranfer = result[0].data.concat(result[1].data)
            newTranfer = newTranfer.sort((a, b) => {
                return a.created_at - b.created_at
            })
            res.status(200).json({
                status: 200,
                message: `Berhasil menampilkan data`,
                data: newTranfer
            })
        }).catch((error) => {
            res.status(error.status).json(error)
        })
    }
}