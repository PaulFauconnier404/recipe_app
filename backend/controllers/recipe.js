const Recipe = require('../models/recipe');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const ObjectId = require('mongodb').ObjectId; 



exports.getOneRecipe = (req, res, next) => {
  const id = new ObjectId(req.params.id);

  Recipe.findOne({_id : id}).then(
    (recipes) => {res.status(200).json(recipes);}
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



exports.updateRecipe = async (req, res, next) => {

  try {
  const id = new ObjectId(req.params.id);

  const recipe = await Recipe.findOne({ _id: id })

  if (req.body.note) {
    recipe.note = req.body.note
  }
 

  await recipe.save();
  res.status(200).json(recipe)
} catch {
  res.status(404)
  res.send({ error: "Recipe doesn't exist!" })
}


};