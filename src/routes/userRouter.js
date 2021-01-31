const express = require('express')
const userController = require('../controllers/userController')
const userRouter = express.Router()

const checkToken = require('../helpers/checkToken')
const imageUpload = require ('../helpers/uploadImg')

userRouter.patch('/changePassword',checkToken.isLogin, userController.changePassword)
userRouter.patch('/changeInfo',checkToken.isLogin, checkToken.phoneUsed,userController.ChangePersonalInfo)
userRouter.patch('/changePhoto', checkToken.isLogin, imageUpload, userController.ChangePhotoProfile)

module.exports = userRouter