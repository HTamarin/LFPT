var express = require("express");
var router = express.Router();
var bcrypt = require("bcrypt");
var salt = bcrypt.genSaltSync(10);

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
  router.post("/login", (req, res) => {
    con.query(
      `SELECT motdepasse FROM utilisateur WHERE username='${req.body.email}'`,
      function (err, result) {
        if (err) throw err;

        // // AJOUTER LA VERIF DU PASS PAR RAPPORT AU HASH

        hash = bcrypt.hashSync(`${req.body.password}`, salt);

        if (
          result.length != 0 &&
          bcrypt.compareSync(result[0].motdepasse, hash)
        ) {
          req.session.user = req.body.email;
          res.redirect("/route/dashboard");
        } else {
          req.session.error = `Votre nom d'utilisateur ou votre mot de passe est incorrect`;
          res.redirect("/");
        }
      }
    );
  });

  router.get("/register", (req, res) => {
    if(req.query.status){res.locals.error = 'Un compte avec cet email existe déjà' }
    res.render("register", { title: "Register System" });
  });

  router.get("/add", (req, res) => {
    if (req.session.user) {
      var sql = `SELECT * FROM theme`;
      con.query(sql, function (err, result) {
        console.log(result);
        res.render("newquestion", {
          title: "Nouvelle question",
          listResults: result,
        });
      });
    } else {
      res.render("404");
    }
  });

  router.post("/add", (req, res) => {
    if (req.session.user) {
      var sql = `INSERT INTO question (question, texteR1, texteR2, texteR3, correct_answer, difficulty,value, id_theme ) VALUES ('${req.body.question}', '${req.body.texteR1}','${req.body.texteR2}','${req.body.texteR3}','${req.body.answers}','${req.body.difficulty}','${req.body.difficulty}','${req.body.theme}')`;
      con.query(sql, function (err, result) {
        console.log(result);
        req.session.valid;
        if (err) throw err;
        res.redirect(`/route/dahsboard?valid='created'`);
      });
    } else {
      res.render("404");
    }
  });

  router.get("/update", (req, res) => {
    if (req.session.user) {
      var sql = `SELECT * FROM question WHERE id=${req.query.id}`;
      if (req.query.valid) {
        res.locals.valid = "La question a bien été modifiée";
      }
      con.query(sql, function (err, result) {
        res.render("update", {
          title: "Modifier",
          listResults: result,
          id: req.query.id,
        });
      });
    } else {
      res.render("404");
    }
  });

  router.post("/update", (req, res) => {
    if (req.session.user) {
      var sql = `UPDATE question SET question='${req.body.question}',texteR1='${req.body.texteR1}',texteR2='${req.body.texteR2}',texteR3='${req.body.texteR3}',correct_answer=${req.body.answers} WHERE id=${req.query.id}`;
      con.query(sql, function (err, result) {
        if (err) throw err;
        res.redirect(`/route/update?id=${req.query.id}&valid='created'`);
      });
    } else {
      res.render("404");
    }
    // var sql = `SELECT * FROM question WHERE id=${req.query.id}`;
    // con.query(sql, function (err, result) {
    //     console.log(result);
    //     res.render('update', { title : "Modifier", listResults: result ,id : req.query.id});
    // });
  });

  router.post("/register", (req, res) => {
    var sql = `SELECT COUNT(*) from utilisateur WHERE username = '${req.body.email}'`;
    con.query(sql, function (err, result) {
        if(result!=0){
            req.session.error = "Un compte avec cet email existe déjà";
            res.redirect("/route/register?status=exist");
        }else{
      var hash = bcrypt.hashSync(`${req.body.password}`, salt);
if(req.body.email && req.body.password){
      var sql = `INSERT INTO utilisateur (username, motdepasse, role) VALUES ('${req.body.email}', '${hash}','superadmin')`;
      con.query(sql, function (err, result) {
        if (err) throw err;
        console.log("1 record inserted");
        req.session.validate = "Votre compte a bien été créé";
        res.redirect("/");
      });
    }else{
        req.session.error = "Email ou mot de passe incorrect";
        res.redirect("/route/register?status=error");
    };
};
    });
  });

  // route for dashboard
  router.get("/dashboard", (req, res) => {
    if (req.session.user) {
      con.query(
        `SELECT * FROM question INNER JOIN theme ON question.id_theme = theme.id`,
        function (err, result) {
          console.log(result);
          if (err) throw err;
          if (req.query.valid) {
            res.locals.valid = "Votre question a bien été créée";
          }
          res.render("dashboard", {
            user: req.session.user,
            listResults: result,
          });
        }
      );
    } else {
      res.render("404");
    }
  });

  // route for logout
  router.get("/logout", (req, res) => {
    req.session.destroy(function (err) {
      if (err) {
        console.log(err);
        res.send("Error");
      } else {
        res.render("base", {
          title: "Express",
          logout: "logout Successfully...!",
        });
      }
    });
  });
});
module.exports = router;
