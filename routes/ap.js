var express = require('express');
var router = express.Router();
var apService = require('../services/ap-services');
var handleLockService = require('../services/handleLock-service');

router.get('/on', (req, res, next) => {
    handleLockService.handleWithLock('aplock',apService.enable, res);
});

router.get('/off', (req, res, next) => {
    handleLockService.handleWithLock('aplock',apService.disable, res);
});

module.exports = router;
