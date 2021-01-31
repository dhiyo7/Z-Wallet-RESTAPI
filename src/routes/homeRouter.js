const express= require('express')
const homeController = require ('../controllers/homeController')
const checkToken = require('../helpers/checkToken')
const homeRouter = express.Router()

homeRouter.get('/getBalance', checkToken.isLogin, homeController.getBalance)
homeRouter.get('/getInvoice', checkToken.isLogin, homeController.getBalanceInOut)
homeRouter.get('/getAllInvoice', checkToken.isLogin, homeController.getAllTranfer)


module.exports = homeRouter