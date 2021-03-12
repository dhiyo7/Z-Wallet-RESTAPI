const homeModel = require('../models/homeModel')

module.exports = {
    getBalance: (req, res) => {
        const { id } = req.decodedToken
        homeModel.getBalance(id)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    getBalanceInOut: (req, res) => {
        const { id } = req.decodedToken
        const { from, to, today, thisWeek, thisMonth } = req.query
        let { flow } = req.query
        let additionalQuery = ''
        if (from != null && to != null) {
            additionalQuery = `AND t.created_at BETWEEN '${from} 00:00:00' AND '${to} 23:59:59'`
        }
        if (today) {
            additionalQuery = `AND t.created_at >= CURRENT_DATE`
        }
        if (thisWeek) {
            additionalQuery = `AND WEEK(t.created_at,1)  = WEEK(CURRENT_DATE,1) AND YEAR(t.created_at) = YEAR(CURRENT_DATE) AND NOT t.created_at >= CURRENT_DATE`
        }
        if (thisMonth) {
            additionalQuery = `AND MONTH(t.created_at) = MONTH(CURRENT_DATE) AND YEAR(t.created_at) = YEAR(CURRENT_DATE) AND NOT WEEK(t.created_at,1)  = WEEK(CURRENT_DATE,1)`
        }
        if (flow == null) {
            flow = 'out'
        }
        homeModel.getBalanceInOut(id, additionalQuery, flow)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    getAllTranfer: (req, res) => {
        const { id } = req.decodedToken
        const { from, to, today, thisWeek, thisMonth } = req.query
        let additionalQuery = ''
        if (from != null && to != null) {
            additionalQuery = `AND t.created_at BETWEEN '${from} 00:00:00' AND '${to} 23:59:59'`
        }
        if (today) {
            additionalQuery = `AND t.created_at >= CURRENT_DATE`
        }
        if (thisWeek) {
            additionalQuery = `AND WEEK(t.created_at,1) = WEEK(CURRENT_DATE,1) AND YEAR(t.created_at) = YEAR(CURRENT_DATE) AND NOT t.created_at >= CURRENT_DATE`
        }
        if (thisMonth) {
            additionalQuery = `AND MONTH(t.created_at) = MONTH(CURRENT_DATE) AND YEAR(t.created_at) = YEAR(CURRENT_DATE) AND NOT WEEK(t.created_at,1)  = WEEK(CURRENT_DATE,1)`
        }
        Promise.all([
            homeModel.getBalanceInOut(id, additionalQuery, 'in'), // 7 row
            homeModel.getBalanceInOut(id, additionalQuery, 'out') // 7 row
        ]).then((result) => {
            let newTranfer = result[0].data.concat(result[1].data)

            newTranfer = newTranfer.sort((a, b) => { //sort date desc
                return b.id - a.id
            })
            newTranfer = newTranfer.filter((value, index) => {
                return index < 7  // biar cuma 7
            })

            res.status(200).json({
                status: 200,
                message: `Berhasil menampilkan data`,
                data: newTranfer
            })
        }).catch((error) => {
            res.status(error.status).json(error)
        })
    }
}