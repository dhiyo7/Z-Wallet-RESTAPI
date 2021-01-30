const userModel = require ('../models/userModel')

module.exports = {
    changePassword:(req,res) =>{
        const {email} = req.decodedToken
        const {body} = req
        authModel.userChangePassword(body, email)
        .then((result) => {
            res.status(result.status).json(result)
        }).catch((error) => {
            res.status(error.status).json(error)
        })
    },
    ChangePersonalInfo: (req, res) => {
        const { body } = req
        const { id } = req.params
        authModel.userChangeInfo(body, id)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
}