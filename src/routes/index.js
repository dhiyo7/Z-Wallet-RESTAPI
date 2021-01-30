const express = require('express');
const mainRouter = express.Router()

const welcomeRouter = require('./welcome')
const authRouter = require('./authRouter')
const userRouter = require('./userRouter')
const topupRouter = require('./topupRouter')
const homeRouter = require('./homeRouter')
const tranferRouter = require ('./tranferRouter')

//calling endpoint handler
mainRouter.use("/", welcomeRouter)
mainRouter.use("/auth", authRouter)
mainRouter.use("/user", userRouter)
mainRouter.use("/home", homeRouter)
mainRouter.use("/topup", topupRouter)
mainRouter.use("/tranfer", tranferRouter)

module.exports = mainRouter