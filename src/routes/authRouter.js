const express = require('express')
const authController = require ('../controllers/authController')
const authRouter = express.Router()

const checkToken = require('../helpers/checkToken')

authRouter.post('/signup',checkToken.isRegistered, authController.Signup)
authRouter.get('/activate/:email/:otp', authController.ActivateAccount)
authRouter.post('/resend',authController.ResendActivationCode)
authRouter.post('/login',authController.Login)
authRouter.patch('/PIN',checkToken.isLogin, authController.SetPIN)
//use it only for change PIN
authRouter.get('/checkPIN/:PIN', checkToken.isLogin, authController.CheckPIN)


authRouter.post('/forgot', authController.ForgotEmail)
authRouter.post('/findOTP', authController.CheckOTP)
authRouter.patch('/reset', authController.resetPassword)
authRouter.delete('/logout/:token',checkToken.isLogin, authController.deleteTokenLogout)

module.exports = authRouter
