const User = require('../models/user');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const ObjectId = require('mongodb').ObjectId; 


// const id = getId(req.params.id)

// try {
//     const docs = await db.collection('interconnexion').findOne( {_id : id} )
//     res.status(200).json(docs)
// } catch (err) {
//     console.log(err)
//     throw err
// }


exports.getOneUser = (req, res, next) => {
  const id = new ObjectId(req.params.id);
  
  User.findOne({_id : id}).then(
    (users) => {
      res.status(200).json(users);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );


};

exports.getByEmail = (req, res, next) => {
  const email = req.params.email;
  
  User.findOne({email : email}).then(
    (users) => {
      res.status(200).json(users);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );


};



exports.getAllUsers = (req, res, next) => {
  User.find().then(
    (users) => {
      res.status(200).json(users);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );
};


  
exports.createUser = (req, res, next) => {
  bcrypt.hash(req.body.password, 10)

  .then(hash => {
  const user = new User({
    name: req.body.name,
    firstname: req.body.firstname,
    birthdate: req.body.birthdate,
    pseudo: req.body.pseudo,
    email: req.body.email,
    password: hash,
    favRecipe: req.body.favrecipe,
  });
  user.save()
  .then(() => res.status(201).json({message: 'Nouvel utilisateur créé'})).
  catch(error => res.status(400).json({error: error}));
})
.catch(error => res.status(500).json({error: error}));
};

exports.updateUser = (req, res, next) => {
  const id = new ObjectId(req.params.id);

 
  const user = new User({
    _id: id,
    name: req.body.name,
    firstname: req.body.firstname,
    birthdate: req.body.birthdate,
    pseudo: req.body.pseudo,
    email: req.body.email,
  });

  user.patch()
  .then(() => res.status(201).json({message: 'Utilisateur modifié'})).
  catch(error => res.status(400).json({error: error}));


};

exports.login = (req, res, next) => {
  console.log(req.body.email)

  User.findOne({ email: req.body.email })
    .then(user => {
      if (!user) {
        return res.status(401).json({ error: 'Aucun utilisateur n\'est enregistré avec cet email' });
      }
      bcrypt.compare(req.body.password, user.password)
        .then(valid => {
          if (!valid) {
            return res.status(401).json({ error: 'Le mot de passe saisi est incorrect' });
          }
          res.status(200).json({
            userId: user._id,
            token: jwt.sign(
              { userId: user._id },
              'RANDOM_TOKEN_SECRET',
              { expiresIn: '24h' }
            )
          });
        })
        .catch(error => res.status(500).json({ error }));
    })
    .catch(error => res.status(500).json({ error }));
};
