const tranferModel = require('../models/tranferModel')

module.exports = {
    tranferBalance: (req, res) => {
        const { sender, receiver, amount } = req.body
        tranferModel.postNewTranfer(sender, receiver, amount)
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
    searchReceiver:(req, res) =>{
        const {name} = req.body
        tranferModel.searchReceiver(name)
        .then((result) =>{
            res.status(result.status).json(result)
        }).catch((error) => {
            res.status(error.status).json(error)
        })
    },
}