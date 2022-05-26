const mongoose = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');

const userSchema = mongoose.Schema({
  name: { type: String, required: true },
  firstname: { type: String, required: true },
  pseudo: { type: String, required: true, unique: true },
  picture: { type: String, required: true, unique: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  favRecipe: [{ type: String, required: true}],

});

userSchema.plugin(uniqueValidator);

module.exports = mongoose.model('User', userSchema);