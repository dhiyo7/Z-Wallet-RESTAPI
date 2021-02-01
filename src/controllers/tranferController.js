const tranferModel = require('../models/tranferModel')

module.exports = {
    tranferBalance: (req, res) => {
        const sender = req.decodedToken.id
        const { receiver, amount, notes } = req.body
        tranferModel.postNewTranfer(sender, receiver, amount, notes)
            .then((result) => {
                const {details} = result
                Promise.all([
                    tranferModel.reduceBalance(sender, amount),
                    tranferModel.increaseBalance(receiver, amount)
                ]).then((result) => {
                    res.status(200).json({
                        ...result[1],
                        details
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
        const { id } = req.decodedToken
        tranferModel.searchReceiver(name, id)
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


// state = {
//     recipient:0,
//     detailRecipient:{}
// }

// axios.get(URL)
// .then(({data}) =>{
//     this.setState({
//         recipient: data.data.recipient
//     })
//     axios.get(URL+this.state.recipient)
//     .then(({data}) =>{
//         this.setState({
//             detailRecipient:data.data
//         })
//     })
// })