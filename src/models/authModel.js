const db = require('../config/mySQL')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const otp = require('otp-generator')
const nodemailer = require('nodemailer')

module.exports = {
    authSignup: (body) => {
        return new Promise((resolve, rejects) => {
            const saltRounds = Math.floor(Math.random() * 10) + 1
            bcrypt.hash(body.password, saltRounds, (err, hashedPassword) => { //hashPW
                const newUser = { ...body, password: hashedPassword }
                const queryStr = `INSERT INTO tb_user SET ?`
                db.query(queryStr, newUser, (err, data) => {
                    if (!err) {
                        const otpCode = otp.generate(6, { alphabets: true, upperCase: true, specialChars: false })
                        const OTPsend = {
                            email: body.email,
                            otp: otpCode
                        }
                        const queryStr = `INSERT INTO tb_otp_activation SET ?`
                        db.query(queryStr, OTPsend, (err, data) => {
                            if (!err) {
                                let transporter = nodemailer.createTransport({
                                    service: 'gmail',
                                    host: 'smtp.gmail.com',
                                    port: 578,
                                    secure: false,
                                    auth: {
                                        user: process.env.USER_EMAIL,
                                        pass: process.env.PASS_EMAIL
                                    }
                                })
                                let mailOptions = {
                                    from: "zWallet Team <zWallet@arkademy.mail.com>",
                                    to: body.email,
                                    subject: 'OTP Code Activation Account',
                                    html:
                                        ` 
                                                <h1> OTP CODE from zWallet Team </h1>
                                                <p> Hello, this is you OTP code</p>
                                                <h2><strong>${otpCode}</strong></h2> 
                                                <p> Use it to Activate Account </p>
                                                `
                                }
                                transporter.sendMail(mailOptions, (err, data) => {
                                    if (err) {
                                        console.log("Its Error: ", err);
                                        rejects({
                                            status: 500,
                                            message: err
                                        })
                                    } else {
                                        console.log(`Sent to ${body.email} Success!!!!`);
                                        resolve({
                                            status: 200,
                                            message: `Kode OTP telah dikirim ke email anda`
                                        })
                                    }
                                })

                            } else {
                                reject({
                                    status: 500,
                                    message: `Internal server error`,
                                    details: err
                                })
                            }
                        })
                    } else {
                        reject({
                            msg: `ERROR!`,
                            details: err
                        })
                    }
                })
            })
        })
    },
    authActivate: (email, otp) => {
        return new Promise((resolve, reject) => {
            const queryStr = `SELECT * FROM tb_otp_activation WHERE email = ? AND otp = ?`
            db.query(queryStr, [email, otp], (err, data) => {
                if (!err) {
                    if (data[0]) {
                        const qs = `DELETE FROM tb_otp_activation WHERE email = ? and otp = ?`
                        db.query(qs, [email, otp], (err, data) => {
                            if (!err) {
                                const activateAcc = `UPDATE tb_user SET is_active = 1 WHERE email = ?`
                                db.query(activateAcc, email, (err, data) => {
                                    if (!err) {
                                        resolve({
                                            status: 200,
                                            message: `Selamat akun anda berhasil diaktivasi`,
                                            email: email
                                        })
                                    } else {
                                        reject({
                                            status: 500,
                                            message: `INTERNAL SERVER ERROR`,
                                            details: err
                                        })
                                    }
                                })
                            } else {
                                reject({
                                    status: 500,
                                    message: `INTERNAL SERVER ERROR`,
                                    details: err
                                })
                            }
                        })
                    } else {
                        reject({
                            status: 404,
                            message: `Kode OTP tidak sesuai atau email belum terdaftar atau akun sudah pernah di aktivasi`
                        })
                    }
                } else {
                    reject({
                        status: 500,
                        message: `INTERNAL SERVER ERROR`,
                        details: err
                    })
                }
            })
        })
    },
    authResendActivation: (email) => {
        return new Promise((resolve, reject) => {
            const getUser = `SELECT email, is_active FROM tb_user WHERE email = ?`
            db.query(getUser, email, (err, data) => {
                if (!err) {
                    if (data[0]) {
                        if (data[0].isActive != 0) {
                            reject({
                                status: 401,
                                message: `Akun anda sudah pernah di aktivasi`
                            })
                        } else {
                            const delOtp = `DELETE FROM tb_otp_activation WHERE email = ?`
                            db.query(delOtp, email, (err, data) => {
                                if (!err) {
                                    const otpCode = otp.generate(6, { alphabets: true, upperCase: true, specialChars: false })
                                    const dataResend = {
                                        email: email,
                                        otp: otpCode
                                    }
                                    const queryStr = `INSERT INTO tb_otp_activation SET ?`
                                    db.query(queryStr, dataResend, (err, data) => {
                                        if (!err) {
                                            let transporter = nodemailer.createTransport({
                                                service: 'gmail',
                                                host: 'smtp.gmail.com',
                                                port: 578,
                                                secure: false,
                                                auth: {
                                                    user: process.env.USER_EMAIL,
                                                    pass: process.env.PASS_EMAIL
                                                }
                                            })
                                            let mailOptions = {
                                                from: "zWalet Team <zwallet@mail.com>",
                                                to: email,
                                                subject: 'OTP Code Activation Account',
                                                html:
                                                    ` 
                                                <h1> OTP CODE from Blanja.in Team </h1>
                                                <p> Hello, this is you OTP code</p>
                                                <h2>${otpCode} </h2> 
                                                <p> Use it to Activate Account </p>
                                                `
                                            }
                                            transporter.sendMail(mailOptions, (err, data) => {
                                                if (err) {
                                                    console.log("Its Error: ", err);
                                                    rejects({
                                                        status: 500,
                                                        message: err
                                                    })
                                                } else {
                                                    console.log(`Sent to ${body.email} Success!!!!`);
                                                    resolve({
                                                        status: 200,
                                                        message: `Kode OTP telah dikirim ke email anda`
                                                    })
                                                }
                                            })
                                        } else {
                                            reject({
                                                status: 500,
                                                message: `Internal server error`,
                                                details: err
                                            })
                                        }
                                    })
                                } else {
                                    reject({
                                        status: 500,
                                        message: `Internal server error`,
                                        details: err
                                    })
                                }
                            })
                        }
                    } else {
                        reject({
                            status: 404,
                            message: `Email tidak ditemukan`
                        })
                    }
                } else {
                    reject({
                        status: 500,
                        message: `Internal server error`,
                        details: err
                    })
                }
            })

        })
    },
    authLogin: (body) => {
        return new Promise((resolve, reject) => {
            const { email, password } = body
            const queryStr = `SELECT id, email,name, password,is_active, pin FROM tb_user WHERE email = ?`
            db.query(queryStr, email, (err, data) => {
                if (err) {
                    reject({
                        status: 500,
                        message: `Error ditemukan pada query`,
                        details: err
                    })
                } else {
                    if (data.length < 1) {
                        reject({
                            status: 404,
                            message: `Username atau password salah!`
                        })
                    } else if (data[0].is_active == 0) {
                        reject({
                            status: 401,
                            message: `Please activate your account first!`
                        })
                    } else {
                        bcrypt.compare(password, data[0].password, (error, result) => {
                            if (error) {
                                reject({
                                    status: 500,
                                    msg: `Proses Hash Error!`
                                })
                            }
                            //result error ?
                            if (!result) {
                                reject({
                                    status: 404,
                                    msg: `Username atau Password salah!`
                                })
                            } else {
                                const payload = {
                                    id: data[0].id,
                                    email,
                                    fullname: data[0].name,
                                }
                                const token = jwt.sign(payload, process.env.SECRET_KEY, { expiresIn: '24h' })
                                const insertTokenLogin = `INSERT INTO tb_login_token SET token = ?`
                                db.query(insertTokenLogin, token, (err, result) => {
                                    if (!err) {
                                        if (data[0].pin == 0) {
                                            resolve({
                                                status: 203, //BINGUNG STATUS RESPONSE
                                                message: `Set your PIN First!`,
                                                data: { ...payload, token }
                                            })
                                        } else {
                                            resolve({
                                                status: 200,
                                                message: `Sukses Login`,
                                                data: { ...payload, token }
                                            })
                                        }
                                    } else {
                                        reject({
                                            status: 500,
                                            message: `Internal Server Error!`,
                                            details: err
                                        })
                                    }
                                })

                            }

                        })

                    }
                }

            })
        })
    },
    //can be used to change PIN too
    authSetPIN: (email, PIN) => {
        return new Promise((resolve, reject) => {
            const queryStr = `UPDATE tb_user SET pin = ? WHERE email = ?`
            db.query(queryStr, [PIN, email], (err, data) => {
                if (!err) {
                    resolve({
                        status: 200,
                        message: `SET PIN berhasil`
                    })
                } else {
                    reject({
                        status: 500,
                        message: err
                    })
                }
            })
        })
    },
    authCheckPIN: (email, PIN) => {
        return new Promise((resolve, reject) => {
            const queryStr = `SELECT * FROM tb_user WHERE email = ? AND pin = ?`
            db.query(queryStr, [email, PIN], (err, data) => {
                if (!err) {
                    if (data.length > 0) {
                        resolve({
                            status: 200,
                            message: `PIN berhasil diidentifikasi`
                        })
                    } else {
                        reject({
                            status: 404,
                            message: `PIN salah`
                        })
                    }
                } else {
                    reject({
                        status: 500,
                        details: err
                    })
                }
            })
        })
    },
    authForgot: (email) => { //OTP for PIN/Password
        return new Promise((resolve, reject) => {
            const getUser = `SELECT email FROM tb_user WHERE email = ?`
            db.query(getUser, email, (err, data) => {
                if (!err) {
                    if (data[0]) {
                        const delOtp = `DELETE FROM tb_otp_reset WHERE email = ?`
                        db.query(delOtp, email, (err, data) => {
                            if (!err) {
                                const otpCode = otp.generate(6, { alphabets: true, upperCase: true, specialChars: false })
                                const dataResend = {
                                    email: email,
                                    otp: otpCode
                                }
                                const queryStr = `INSERT INTO tb_otp_reset SET ?`
                                db.query(queryStr, dataResend, (err, data) => {
                                    if (!err) {
                                        let transporter = nodemailer.createTransport({
                                            service: 'gmail',
                                            host: 'smtp.gmail.com',
                                            port: 578,
                                            secure: false,
                                            auth: {
                                                user: process.env.USER_EMAIL,
                                                pass: process.env.PASS_EMAIL
                                            }
                                        })
                                        let mailOptions = {
                                            from: "zWallet Team <zWallet@arkademy.mail.com>",
                                            to: email,
                                            subject: 'OTP Code Reset PIN/Password',
                                            html:
                                                ` 
                                                        <h1> OTP CODE from zWallet Team </h1>
                                                        <p> Hello, this is you OTP code</p>
                                                        <h2><strong>${otpCode}</strong></h2> 
                                                        <p> Use it to reset PIN/Password </p>
                                                        `
                                        }
                                        transporter.sendMail(mailOptions, (err, data) => {
                                            if (err) {
                                                console.log("Its Error: ", err);
                                            } else {
                                                console.log("Sent Success!!!!");
                                                resolve({
                                                    status: 200,
                                                    message: `Kode OTP telah dikirim ke email anda`
                                                })
                                            }
                                        })

                                    } else {
                                        reject({
                                            status: 500,
                                            message: `Internal server error`,
                                            details: err
                                        })
                                    }
                                })
                            } else {
                                reject({
                                    status: 500,
                                    message: `Internal server error`,
                                    details: err
                                })
                            }
                        })
                    } else {
                        reject({
                            status: 404,
                            message: `Email tidak ditemukan`
                        })
                    }
                } else {
                    reject({
                        status: 500,
                        message: `Internal server error`,
                        details: err
                    })
                }
            })

        })
    },
    authCheckOTP: (email, otp) => {
        return new Promise((resolve, reject) => {
            const queryStr = `SELECT * FROM tb_otp_reset WHERE email = ? AND otp = ?`
            db.query(queryStr, [email, otp], (err, data) => {
                if (!err) {
                    if (data[0]) {
                        const qs = `DELETE FROM tb_otp_reset WHERE email = ? and otp = ?`
                        db.query(qs, [email, otp], (err, data) => {
                            if (!err) {
                                resolve({
                                    status: 200,
                                    message: `Silahkan set ulang PIN/Password anda`,
                                    email: email
                                })
                            } else {
                                reject({
                                    status: 500,
                                    message: `INTERNAL SERVER ERROR`,
                                    details: err
                                })
                            }
                        })
                    } else {
                        reject({
                            status: 404,
                            message: `Kode OTP tidak sesuai`
                        })
                    }
                } else {
                    reject({
                        status: 500,
                        message: `INTERNAL SERVER ERROR`,
                        details: err
                    })
                }
            })
        })
    },
    userChangePassword: (body) => {
        return new Promise((resolve, reject) => {
            const { email, old_password, new_password } = body
            const queryStr = `SELECT password FROM tb_user WHERE email = ?`
            db.query(queryStr, email, (err, data) => {
                if (!err) {
                    if (data.length > 0) {
                        bcrypt.compare(old_password, data[0].password, (error, result) => {
                            if (error) {
                                reject({
                                    status: 500,
                                    message: error
                                })
                            }
                            if (!result) {
                                reject({
                                    status: 401,
                                    message: 'Password salah'
                                })
                            } else {
                                const saltRounds = Math.floor(Math.random() * 10) + 1
                                bcrypt.hash(new_password, saltRounds, (errorHash, hashedPassword) => {
                                    if (errorHash) {
                                        reject({
                                            statu: 500,
                                            message: errorHash
                                        })
                                    } else {
                                        const updatePassword = `UPDATE tb_user SET password = ? WHERE email = ?`
                                        db.query(updatePassword, [hashedPassword, email], (errorUpdate, dataUpdate) => {
                                            if (!errorUpdate) {
                                                resolve({
                                                    status: 200,
                                                    message: `Change Password , berhasil`
                                                })
                                            }else{
                                                reject({
                                                    status:500,
                                                    message:errorUpdate
                                                })
                                            }
                                        })
                                    }
                                })
                            }
                        })
                    } else {
                        reject({
                            status: 404,
                            message: `data tidak ditemukan`
                        })
                    }
                }else{
                    reject({
                        status:500,
                        message:err
                    })
                }
            })
        })
    },
    userChangeInfo: (body, id) => { //includes all userData (PIN, PhoneNumber, and etc.)
        return new Promise((resolve, reject) => {
            const queryStr = `UPDATE tb_user SET ? WHERE id = ?`
            db.query(queryStr, [body, id], (err, data) => {
                if (!err) {
                    resolve({
                        status: 200,
                        message: `Data berhasil diubah`,
                        details: body
                    })
                } else {
                    reject({
                        status: 500,
                        message: err
                    })
                }
            })
        })
    },
    userChangePhoto: (image, id) => {
        return new Promise((resolve, reject) => {
            const queryStr = `UPDATE tb_user SET image = ? WHERE id = ?`
            db.query(queryStr, [image, id], (err, data) => {
                if (!err) {
                    resolve({
                        status: 200,
                        message: `Berhasil mengubah foto profil`
                    })
                } else {
                    reject({
                        status: 500,
                        message: err
                    })
                }
            })
        })
    },
    deleteTokenLogout: (dataToken) => {
        return new Promise((resolve, reject) => {
            const queryStr = `DELETE FROM tb_login_token WHERE token = ?`
            db.query(queryStr, dataToken, (err, data) => {
                if (!err) {
                    resolve({
                        status: 200,
                        message: `Sukses`
                    })
                } else {
                    reject({
                        status: 500,
                        message: err
                    })
                }
            })
        })
    },
}