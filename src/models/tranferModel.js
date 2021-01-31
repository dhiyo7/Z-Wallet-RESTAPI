const db = require('../config/mySQL')

module.exports = {
    postNewTranfer: (sender, receiver, amount, notes) => {
        return new Promise((resolve, reject) => {
            let dataTranfer = {
                sender: sender,
                receiver: receiver,
                amount: amount,
                notes:notes,
                type: 1
            }
            const queryStr = `INSERT INTO tb_tranfer SET ?`
            db.query(queryStr, dataTranfer, (err, data) => {
                if (!err) {
                    dataTranfer = {
                        ...dataTranfer, type: 2
                    }
                    const queryStr = `INSERT INTO tb_tranfer SET ?`
                    db.query(queryStr, dataTranfer, (err, data) => {
                        if (!err) {
                            resolve({
                                status: 200,
                                message: `Tranfer sukses`
                            })
                        } else {
                            reject({
                                status: 500,
                                message: `internal server error`,
                                details: err
                            })
                        }
                    })
                } else {
                    reject({
                        status: 500,
                        message: `internal server error`,
                        details: err
                    })
                }
            })
        })
    },
    increaseBalance: (receiver, amount) => {
        return new Promise((resolve, reject) => {
            const queryStr = `UPDATE tb_balance SET balance = balance+${amount} WHERE id_user = ?`
            db.query(queryStr, receiver, (err, data) => {
                if (!err) {
                    resolve({
                        status: 200,
                        message: `berhasil`
                    })
                } else {
                    reject({
                        status: 500,
                        message: `internal server error`,
                        details: err
                    })
                }
            })
        })
    },
    reduceBalance: (sender, amount) => {
        return new Promise((resolve, reject) => {
            const queryStr = `UPDATE tb_balance SET balance = balance-${amount} WHERE id_user = ?`
            db.query(queryStr, sender, (err, data) => {
                if (!err) {
                    resolve({
                        status: 200,
                        message: `berhasil`
                    })
                } else {
                    reject({
                        status: 500,
                        message: `internal server error`,
                        details: err
                    })
                }
            })
        })
    },
    searchReceiver: (name, id) => {
        return new Promise((resolve, reject) => {
            const queryStr = `SELECT id, name, phone, image FROM tb_user WHERE name LIKE '%${name}%' AND NOT id = ${id}`
            db.query(queryStr,(err, data) => {
                if (!err) {
                    if (data.length > 0) {
                        resolve({
                            status: 200,
                            message: `Pencarian untuk ${name} ditemukan`,
                            data: data
                        })
                    } else {
                        reject({
                            status: 404,
                            message: `Pencarian tidak ditemukan`,
                            data: []
                        })
                    }
                } else {
                    reject({
                        status: 500,
                        message: `internal server error`,
                        details: err
                    })
                }
            })
        })
    },
    getAllContact: (id) => {
        return new Promise((resolve, reject) => {
            const queryStr = `SELECT id, name, phone, image FROM tb_user WHERE NOT ID = ? AND is_active = 1`
            db.query(queryStr, id, (err, data) => {
                if (!err) {
                    if (data.length > 0) {
                        resolve({
                            status: 200,
                            data: data
                        })
                    } else {
                        reject({
                            status: 404,
                            data: []
                        })
                    }
                } else {
                    reject({
                        status: 500,
                        message: `internal server error`,
                        details: err
                    })
                }
            })
        })
    }
}