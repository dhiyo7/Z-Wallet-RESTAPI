const express = require('express')
const userController = require('../controllers/userController')
const userRouter = express.Router()

const checkToken = require('../helpers/checkToken')

userRouter.patch('/changePassword',checkToken.isLogin, userController.changePassword)
userRouter.patch('/changeInfo',checkToken.isLogin, userController.ChangePersonalInfo)

module.exports = userRouter