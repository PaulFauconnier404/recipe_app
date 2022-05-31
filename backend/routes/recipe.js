const express = require('express');

const router = express.Router();
const recipeCtrl = require('../controllers/recipe');

// Routes
router.get('/', recipeCtrl.getAllRecipe);
router.get('/:id', recipeCtrl.getOneRecipe);


module.exports = router;