const db = require('../config/mySQL')

module.exports = {
    getIdUser: (phone) => {
        return new Promise((resolve, reject) => {
            const queryStr = `SELECT id FROM tb_user WHERE phone = ? AND is_active = 1`
            db.query(queryStr, phone, (err, data) => {
                if (!err) {
                    if (data.length == 1) {
                        resolve({
                            status: 200,
                            data: data[0].id
                        })
                    } else {
                        reject({
                            status: 404,
                            data: `No. HP tidak ditemukan`
                        })
                    }
                } else {
                    reject({
                        status: 500,
                        message: 'internal server error',
                        details: err
                    })
                }
            })
        })
    },
    topupBalance: (id, amount) => {
        return new Promise((resolve, reject) => {
            const queryStr = `UPDATE tb_balance SET balance = balance+${amount} WHERE id_user = ?`
            db.query(queryStr, id, (err, data) => {
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
    insertTranfer: (topupCenter, id, amount) => {
        return new Promise((resolve, reject) => {
            let dataTranfer = {
                sender: topupCenter,
                receiver: id,
                amount: amount,
                notes:`Topup Balance`,
                type: 2
            }
            console.log('here')
            const queryStr = `INSERT INTO tb_tranfer SET ?`
            db.query(queryStr, dataTranfer, (err, data) => {
                if (!err) {
                    resolve({
                        status: 200,
                        message: 'sukses'
                    })
                } reject({
                    status: 500,
                    message: `internal server error`,
                    details: err
                })
            })
        })
    }

}