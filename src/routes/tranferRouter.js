const express = require('express')
const tranferController = require ('../controllers/tranferController')
const tranferRouter = express.Router()

const checkToken = require ('../helpers/checkToken')

tranferRouter.post('/newTranfer', checkToken.isLogin, checkToken.isPIN, tranferController.tranferBalance )
tranferRouter.get('/search', checkToken.isLogin, tranferController.searchReceiver)
tranferRouter.get('/contactUser',checkToken.isLogin, tranferController.getAllContact )
tranferRouter.get('/details/:id', checkToken.isLogin, tranferController.getTranferDetails)


module.exports = tranferRouter