const express = require('express');
const router = express.Router();

const viewAllVaccinations = require('../dbAccess/dbAccessVaccinations').viewAllVaccinations;
const viewVaccinationsOfPatient = require('../dbAccess/dbAccessVaccinations').viewVaccinationsOfPatient;
const addVaccination = require('../dbAccess/dbAccessVaccinations').addVaccination;
const getNumberOfNotVaccinated = require('../dbAccess/dbAccessVaccinations').getNumberOfNotVaccinated;
const inputValidationObject = require('./inputValidation').inputValidationObject;
const inputValidationId = require('./inputValidation').inputValidationId;


router.get('/viewAllVaccinations', async (req, res) => {
    try {
        res.json(await viewAllVaccinations());
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

router.post('/viewVaccinationsOfPatient', async (req, res) => {
    try {
        if (!inputValidationId(req.body.patientId))
            throw ({ status: 400, message: 'INVALID ID' })
        else
            res.json(await viewVaccinationsOfPatient(req.body.patientId))
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

router.post('/addVaccination', async (req, res) => {
    try {
        if (!req.body.patientId || !req.body.vaccinationDate || !req.body.manufacturerId || !inputValidationObject(req.body)) {
            throw ({ status: 400, message: 'INVALID INPUT' })
        }
        else
            res.json(await addVaccination(req.body));
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

router.get('/getNumberOfNotVaccinated', async (req, res) => {
    try {
        res.json(await getNumberOfNotVaccinated());
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

module.exports = router;