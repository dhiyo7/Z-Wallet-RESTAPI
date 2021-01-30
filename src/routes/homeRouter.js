const express= require('express')
const homeController = require ('../controllers/homeController')
const checkToken = require('../helpers/checkToken')
const homeRouter = express.Router()

homeRouter.get('/getBalance/:id', checkToken.isLogin, homeController.getBalance)
homeRouter.get('/getBalanceIn', checkToken.isLogin, homeController.getBalanceIn)
homeRouter.get('/getBalanceOut', checkToken.isLogin, homeController.getBalanceOut)
homeRouter.get('/getAllTranfer', checkToken.isLogin, homeController.getAllTranfer)


module.exports = homeRouter