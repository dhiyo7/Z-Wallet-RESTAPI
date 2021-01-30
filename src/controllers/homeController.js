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
        const { id } = req.decodedToken
        const {from, to} = req.query
        let additionalQuery=''
        // if(from !=null && to !=null)
        // additionalQuery = `AND t.created_at BETWEEN CONVERT(datetime,'${from}') AND CONVERT(datetime,'${to} 23:59:59:999')`
        homeModel.getBalanceIn(id, additionalQuery)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    getBalanceOut: (req, res) => {
        const { id } = req.decodedToken
        homeModel.getBalanceOut(id)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    getAllTranfer: (req, res) => {
        const { id } = req.decodedToken
        Promise.all([
            homeModel.getBalanceIn(id),
            homeModel.getBalanceOut(id)
        ]).then((result) => {
            let newTranfer = result[0].data.concat(result[1].data)
            newTranfer = newTranfer.sort((a, b) => {
                return b.created_at - a.created_at
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