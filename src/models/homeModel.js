const db = require('../config/mySQL')

module.exports = {
    getBalance: (id) => {
        return new Promise((resolve, reject) => {
            const queryStr =
                `SELECT u.id, u.name , b.balance 
            FROM tb_balance b
            JOIN tb_user u ON b.id_user = u.id 
            WHERE u.id = ?`
            db.query(queryStr, id, (err, data) => {
                if (!err) {
                    if (data.length > 0) {
                        resolve({
                            status: 200,
                            message: `berhasil mendapatkan data`,
                            data: data[0]
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
    getBalanceIn: (id) => {
        return new Promise((resolve, reject) => {
            const queryStr =
                `SELECT t.sender, u.name as sender, t.receiver, us.name as receiver, t.amount, tp.type, t.created_at
            FROM tb_tranfer t
            JOIN tb_user u ON u.id = t.sender
            JOIN tb_user us ON us.id = t.receiver
            JOIN tb_type_transfer tp ON t.type = tp.id
            WHERE t.receiver = ? AND tp.type 'in'
            ORDER BY t.created_at DESC
            LIMIT 7 OFFSET 0
            `
            db.query(queryStr, id, (err, data) => {
                if (!err) {
                    if (data.length > 0) {
                        resolve({
                            status: 200,
                            message: `Daftar transaksi ditemukan`,
                            data: data
                        })
                    } else {
                        resolve({
                            status: 200,
                            message: `Daftar transaksi tidak ditemukan`,
                            data: []
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
    getBalanceOut: (id) => {
        return new Promise((resolve, reject) => {
            const queryStr =
                `SELECT t.sender, u.name as sender, t.receiver, us.name as receiver, t.amount, tp.type, t.created_at
            FROM tb_tranfer t
            JOIN tb_user u ON u.id = t.sender
            JOIN tb_user us ON us.id = t.receiver
            JOIN tb_type_transfer tp ON t.type = tp.id
            WHERE t.sender = ? AND tp.type 'out'
            ORDER BY t.created_at DESC
            LIMIT 7 OFFSET 0
            `
            db.query(queryStr, id, (err, data) => {
                if (!err) {
                    if (data.length > 0) {
                        resolve({
                            status: 200,
                            message: `Daftar transaksi ditemukan`,
                            data: data
                        })
                    } else {
                        reject({
                            status: 200,
                            message: `Daftar transaksi tidak ditemukan`,
                            data: []
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
}