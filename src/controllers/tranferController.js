const tranferModel = require('../models/tranferModel')

module.exports = {
    tranferBalance: (req, res) => {
        const { sender, receiver, amount, notes } = req.body
        tranferModel.postNewTranfer(sender, receiver, amount, notes)
            .then((result) => {
                Promise.all([
                    tranferModel.reduceBalance(sender, amount),
                    tranferModel.increaseBalance(receiver, amount)
                ]).then((result) => {
                    res.status(200).json({
                        status: 200,
                        message: `Tranfer berhasil, saldo anda berkurang ${amount}`
                    })
                }).catch((error) => {
                    res.status(error.status).json(error)
                })
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    searchReceiver: (req, res) => {
        const { name } = req.query
        tranferModel.searchReceiver(name)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    getAllContact: (req, res) => {
        const { id } = req.decodedToken
        tranferModel.getAllContact(id)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
}