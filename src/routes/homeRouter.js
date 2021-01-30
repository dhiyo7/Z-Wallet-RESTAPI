const express= require('express')
const homeController = require ('../controllers/homeController')
const checkToken = require('../helpers/checkToken')
const homeRouter = express.Router()

homeRouter.get('/getBalance/:id', checkToken.isLogin, homeController.getBalance)
homeRouter.get('/getBalanceIn/:id', checkToken.isLogin, homeController.getBalanceIn)
homeRouter.get('/getBalanceOut/:id', checkToken.isLogin, homeController.getBalanceOut)
homeRouter.get('/getAllTranfer/:id', checkToken.isLogin, homeController.getAllTranfer)


module.exports = homeRouter