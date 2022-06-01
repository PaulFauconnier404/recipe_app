const express = require('express');

const router = express.Router();
const userCtrl = require('../controllers/user');

// Routes
router.get('/', userCtrl.getAllUsers);
// router.get('/:id', userCtrl.getOneUser);
router.post('/', userCtrl.createUser);
router.post('/login', userCtrl.login);
router.get('/:email', userCtrl.getByEmail);
router.patch('/:id', userCtrl.updateUser);

module.exports = router;