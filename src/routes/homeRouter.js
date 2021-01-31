const express= require('express')
const homeController = require ('../controllers/homeController')
const checkToken = require('../helpers/checkToken')
const homeRouter = express.Router()

homeRouter.get('/getBalance/:id', checkToken.isLogin, homeController.getBalance)
homeRouter.get('/getBalanceInOut', checkToken.isLogin, homeController.getBalanceInOut)
homeRouter.get('/getAllTranfer', checkToken.isLogin, homeController.getAllTranfer)


module.exports = homeRouter