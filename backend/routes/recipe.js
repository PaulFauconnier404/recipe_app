const express = require('express');

const router = express.Router();
const userCtrl = require('../controllers/recipe');

// Routes
router.get('/', userCtrl.getAllRecipe);
router.get('/:id', userCtrl.getOneRecipe);


module.exports = router;