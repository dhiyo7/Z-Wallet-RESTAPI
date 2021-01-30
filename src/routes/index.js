const express = require('express');
const mainRouter = express.Router()

const welcomeRouter = require('./welcome')
const authRouter = require('./authRouter')
const topupRouter = require('./topupRouter')

//calling endpoint handler
mainRouter.use("/", welcomeRouter)
mainRouter.use("/auth", authRouter) //endpoint auth
mainRouter.use("/topup", topupRouter)

module.exports = mainRouter