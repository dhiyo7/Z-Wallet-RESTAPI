const express = require('express')
const tranferController = require ('../controllers/tranferController')
const tranferRouter = express.Router()

const checkToken = require ('../helpers/checkToken')

tranferRouter.post('/newTranfer', checkToken.isLogin, checkToken.isPIN, tranferController.tranferBalance )
tranferRouter.get('/search', checkToken.isLogin, tranferController.searchReceiver)

module.exports = tranferRouter