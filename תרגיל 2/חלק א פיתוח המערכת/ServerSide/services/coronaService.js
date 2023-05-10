const express = require('express');
const router = express.Router();

const viewAllCorona = require('../dbAccess/dbAccessCorona').viewAllCorona;
const viewCoronaOfPatient = require('../dbAccess/dbAccessCorona').viewCoronaOfPatient;
const addCorona = require('../dbAccess/dbAccessCorona').addCorona;
const getLastMonthCorona = require('../dbAccess/dbAccessCorona').getLastMonthCorona;
const inputValidationObject = require('./inputValidation').inputValidationObject;
const inputValidationId = require('./inputValidation').inputValidationId;


router.get('/viewAllCorona', async (req, res) => {
    try {
        res.json(await viewAllCorona());
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

router.post('/viewCoronaOfPatient', async (req, res) => {
    try {
        if (!inputValidationId(req.body.patientId))
            throw ({ status: 400, message: 'INVALID ID' })
        else
            res.json(await viewCoronaOfPatient(req.body.patientId))
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

router.post('/addCorona', async (req, res) => {
    try {
        if (!inputValidationId(req.body.patientId) || !req.body.positiveResultDate || !req.body.recoveryDate ||
            req.body.recoveryDate < req.body.positiveResultDate || !inputValidationObject(req.body)) {
            throw ({ status: 400, message: 'INVALID INPUT' })
        }
        else
            res.json(await addCorona(req.body));
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

router.get('/getLastMonthCorona', async (req, res) => {
    try {
        res.json(await getLastMonthCorona());
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

module.exports = router;
