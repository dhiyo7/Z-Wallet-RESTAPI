const db = require('../config/mySQL')
const bcrypt = require('bcrypt')

module.exports = {
    getMyUser: (id) => {
        return new Promise((resolve, reject) => {
            const queryStr = `SELECT firstname, lastname, email, phone, image FROM tb_user WHERE id = ?`
            db.query(queryStr, id, (err, data) => {
                if (!err) {
                    resolve({
                        status: 200,
                        message: `OK`,
                        data: data[0]
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
    getSingleUser: (id) => {
        return new Promise((resolve, reject) => {
            const queryStr = `SELECT CONCAT(firstname,' ',lastname) as name, phone, image FROM tb_user WHERE id = ?`
            db.query(queryStr, id, (err, data) => {
                if (!err) {
                    resolve({
                        status: 200,
                        data: data[0]
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
    userChangeInfo: (body, id) => { //includes all userData (PIN, PhoneNumber, and etc.)
        return new Promise((resolve, reject) => {
            const queryStr = `UPDATE tb_user SET ? WHERE id = ?`
            db.query(queryStr, [body, id], (err, data) => {
                if (!err) {
                    resolve({
                        status: 200,
                        message: `Data berhasil diubah`,
                        data: body
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
    userChangePassword: (body, email) => {
        return new Promise((resolve, reject) => {
            const { old_password, new_password } = body
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
                                            } else {
                                                reject({
                                                    status: 500,
                                                    message: errorUpdate
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
                } else {
                    reject({
                        status: 500,
                        message: err
                    })
                }
            })
        })
    },
    getOldPhoto: (id) => {
        return new Promise((resolve, reject) => {
            const queryStr = `SELECT image FROM tb_user WHERE id = ?`
            db.query(queryStr, id, (err, data) => {
                if (!err) {
                    if (data.length > 0) {
                        resolve({
                            status: 200,
                            image: data[0].image
                        })
                    } else {
                        reject({
                            status: 404,
                            image: ''
                        })
                    }
                } else {
                    reject({
                        status: 500,
                        message: 'Internal server error',
                        details: err
                    })
                }
            })
        })
    },
    updatePhoto: (image, id) => {
        return new Promise((resolve, reject) => {
            const queryStr = `UPDATE tb_user SET image = ? WHERE id = ?`
            db.query(queryStr, [image, id], (err, data) => {
                if (!err) {
                    resolve({
                        status: 200,
                        message: 'Berhasil mengubah photo profil'
                    })
                } else {
                    console.log(err)
                    reject({
                        status: 500,
                        message: 'internal server error',
                        details: err
                    })
                }
            })
        })
    }
}