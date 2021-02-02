const authModel = require('./../models/authModel')

module.exports = {
    Signup: (req, res) => {
        const { body } = req
        authModel.authSignup(body)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    ActivateAccount: (req, res) => {
        const { email, otp } = req.params
        authModel.authActivate(email, otp)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    ResendActivationCode: (req, res) => {
        const { email } = req.body
        authModel.authResendActivation(email)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    Login: (req, res) => {
        const { body } = req
        authModel.authLogin(body)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    SetPIN: (req, res) => {
        const { email } = req.decodedToken
        const { PIN } = req.body
        authModel.authSetPIN(email, PIN)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    CheckPIN: (req, res) => {
        const { email } = req.decodedToken
        const { PIN } = req.params
        authModel.authCheckPIN(email, PIN)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    ForgotEmail: (req, res) => {
        const { email } = req.body
        authModel.authForgot(email)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    CheckOTP: (req, res) => {
        const { email, otp } = req.body
        authModel.authCheckOTP(email, otp)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    resetPassword: (req, res) => {
        const { body } = req
        authModel.resetPassword(body)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    deleteTokenLogout: (req, res) => {
        // const token = req.header("x-access-token"); //
        const { token } = req.params
        authModel.deleteTokenLogout(token)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
}