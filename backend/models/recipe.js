const mongoose = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');

const recipeSchema = mongoose.Schema({
  name: { type: String, required: true },
  picture: { type: String, required: true },
  description: { type: String, required: true },
  time: { type: String, required: true },
  category: { type: String, required: true },
  difficulty: { type: String, required: true },
  note: [{}],
  ingredients : [{ type: String, required: true}]
});


module.exports = mongoose.model('Recipe', recipeSchema);