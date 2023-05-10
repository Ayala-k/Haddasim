const express = require('express');
const router = express.Router();

const viewAllManufacturers = require('../dbAccess/dbAccessManufacturers').viewAllManufacturers;
const viewManufacturer = require('../dbAccess/dbAccessManufacturers').viewManufacturer;
const addManufacturer = require('../dbAccess/dbAccessManufacturers').addManufacturer;
const inputValidationObject = require('./inputValidation').inputValidationObject;
const inputValidationId = require('./inputValidation').inputValidationId;


router.get('/viewAllManufacturers', async (req, res) => {
    try {
        res.json(await viewAllManufacturers());
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

router.post('/viewManufacturer', async (req, res) => {
    try {
        if (!inputValidationId(req.body.manufacturerId))
            throw ({ status: 400, message: 'INVALID ID' })
        else
            res.json(await viewManufacturer(req.body.manufacturerId))
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

router.post('/addManufacturer', async (req, res) => {
    try {
        if (!req.body.manufacturerName || !inputValidationId(req.body.manufacturerId) || !inputValidationObject(req.body)) {
            throw ({ status: 400, message: 'INVALID INPUT' })
        }
        else
            res.json(await addManufacturer(req.body));
    }
    catch (error) {
        res.status(error.status).send(error.message)
    }
})

module.exports = router;