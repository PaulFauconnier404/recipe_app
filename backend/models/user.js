const mongoose = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');

const userSchema = mongoose.Schema({
  name: { type: String, required: true, unique: false  },
  firstname: { type: String, required: true, unique: false  },
  pseudo: { type: String, required: true, unique: false },
  birthdate: { type: Date, required: true, unique: false  },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true, unique: false },
  favRecipe: [{type: String, required: false, unique: false }],

});


module.exports = mongoose.model('User', userSchema);