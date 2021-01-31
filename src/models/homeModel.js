const { query } = require('express')
const db = require('../config/mySQL')

module.exports = {
    getBalance: (id) => {
        return new Promise((resolve, reject) => {
            const queryStr =
                `SELECT u.id, CONCAT(u.firstname,' ', u.lastname) as name , b.balance 
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
    getBalanceInOut: (id, additionalQuery,flow) => {
        let user = ''
        if(flow == 'in'){
            user = 't.receiver'
        }else{
            user = 't.sender'
        }
        return new Promise((resolve, reject) => {
            const queryStr =
                `SELECT t.id,t.sender, CONCAT(u.firstname,' ',u.lastname) as sender, t.receiver, CONCAT(us.firstname,' ', us.lastname) as receiver, t.amount,t.notes, tp.type, t.created_at
            FROM tb_tranfer t
            JOIN tb_user u ON u.id = t.sender
            JOIN tb_user us ON us.id = t.receiver
            JOIN tb_type_transfer tp ON t.type = tp.id
            WHERE ${user} = ? AND tp.type = '${flow}'
            ${additionalQuery}
            ORDER BY t.created_at DESC
            LIMIT 7 OFFSET 0
            `
            console.log(queryStr)
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
}