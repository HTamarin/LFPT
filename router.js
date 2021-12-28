var express = require("express");
var router = express.Router();

const mysql = require("mysql");
const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "password",
    database: "supereuro",
  });

con.connect(function (err) {
    if (err) throw err;
    console.log("Connecté à la base de données MySQL!");

// login user
router.post('/login', (req, res)=>{
    con.query(
        "SELECT * FROM utilisateur",
        function (err, result) {
          if (err) throw err;
          res.send(result);
        }
      );
});

router.get('/register', (req, res)=>{
    
       res.render('register')
});

// route for dashboard
router.get('/dashboard', (req, res) => {
    if(req.session.user){
        res.render('dashboard', {user : req.session.user})
    }else{
        res.send("Unauthorize User")
    }
})

// route for logout
router.get('/logout', (req ,res)=>{
    req.session.destroy(function(err){
        if(err){
            console.log(err);
            res.send("Error")
        }else{
            res.render('base', { title: "Express", logout : "logout Successfully...!"})
        }
    })
})
});
module.exports = router;