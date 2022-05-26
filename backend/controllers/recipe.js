const Recipe = require('../models/recipe');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');



exports.getOneRecipe = (req, res, next) => {
  Recipe.findOne({
      _id: req.params.id
  }).then(
    () => {
      res.status(200).json(recipe);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );
};

exports.getAllRecipe = (req, res, next) => {
  Recipe.find().then(
    (recipes) => {
      res.status(200).json(recipes);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );
};


