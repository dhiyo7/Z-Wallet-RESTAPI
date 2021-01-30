const topupModel = require('../models/topupModel')

module.exports = {
    topupBalance: (req, res) => {
        let { phone, amount } = req.body
        phone = phone.toString().replace('23890', '+62')
        topupModel.getIdUser(phone)
            .then((result) => {
                topupModel.topupBalance(result.data, amount)
                    .then((result) => {
                        res.status(result.status).json({
                            ...result,
                            message:`Saldo ${phone} bertambah Rp.${amount}`
                        })
                    }).catch((error) => {
                        res.status(error.status).json(error)
                    })
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    }
}