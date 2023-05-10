const express = require('express');
const router = express.Router();

const viewAllPatients = require('../dbAccess/dbAccessPatients').viewAllPatients;
const addPatient = require('../dbAccess/dbAccessPatients').addPatient;
const viewPatient = require('../dbAccess/dbAccessPatients').viewPatient;
const inputValidationObject = require('./inputValidation').inputValidationObject;
const inputValidationId = require('./inputValidation').inputValidationId;


router.get('/viewAllPatients', async (req, res) => {
    try {
        res.json(await viewAllPatients())
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

router.post('/viewPatient', async (req, res) => {
    try {
        if (!inputValidationId(req.body.patientId))
            throw ({ status: 400, message: 'INVALID ID' })
        else {
            res.json(await viewPatient(req.body.patientId))
        }
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

router.post('/addPatient', async (req, res) => {
    try {
        if (!inputValidationId(req.body.id) || req.body.name == "" || !req.body.phoneNumber ||
            !req.body.dateOfBirth || req.body.dateOfBirth > Date.now() || !inputValidationObject(req.body))
            throw ({ status: 400, message: 'INVALID INPUT' })
        else {
            res.json(await addPatient(req.body));
        }
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

module.exports = router;
