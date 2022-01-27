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
      `SELECT * FROM utilisateur WHERE username=?`,[req.body.email],
      function (err, result) {
        if (err) throw err;
        if (result.length != 0) {
          // // AJOUTER LA VERIF DU PASS PAR RAPPORT AU HASH
          hash = bcrypt.hashSync(req.body.password, salt);
          if (
            bcrypt.compareSync(
              `${req.body.password}`,
              `${result[0].motdepasse}`
            )
          ) {
            req.session.user = req.body.email;
            res.redirect("/route/dashboard");
          } else {
            req.session.error = `Votre nom d'utilisateur ou votre mot de passe est incorrect`;
            res.redirect("/");
          }
        } else {
          req.session.error = `Votre nom d'utilisateur ou votre mot de passe est incorrect`;
          res.redirect("/");
        }
      }
    );
  });

  router.get("/register", (req, res) => {
    if (req.query.status) {
      res.locals.error = "Un compte avec cet email existe déjà";
    }
    res.render("register", { title: "Register System" });
  });

  router.get("/add", (req, res) => {
    if (req.session.user) {
      var sql = `SELECT * FROM theme`;
      con.query(sql, function (err, result) {
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
      var sql = `INSERT INTO question (question, texteR1, texteR2, texteR3, correct_answer, difficulty,value , id_theme ) VALUES (?,?,?,?,?,?,?,?)`;
      var value = [req.body.question.replace("'", "\'"), req.body.texteR1.replace("'", "\'"),req.body.texteR2.replace("'", "\'"),req.body.texteR3.replace("'", "\'"),req.body.answers,req.body.difficulty,req.body.difficulty,req.body.theme]
      con.query(sql,value, function (err, result) {
        req.session.valid;
        if (err) throw err;
        res.redirect(`/route/dashboard?valid='created'`);
      });
    } else {
      res.render("404");
    }
  });

  router.get("/update", (req, res) => {
    if (req.session.user) {
      var sql = `SELECT * FROM question WHERE id=?`;
      if (req.query.valid) {
        res.locals.valid = "La question a bien été modifiée";
      }
      con.query(sql,req.query.id, function (err, result) {
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
      var sql = `UPDATE question SET question=?,texteR1=?,texteR2=?,texteR3=?,correct_answer=? WHERE id=?`;
      var value = [req.body.question.replace("'", "''"),req.body.texteR1.replace("'","''"),req.body.texteR2.replace("'", "''"),req.body.texteR3.replace("'", "''"),req.body.answers,req.query.id]
      con.query(sql,value, function (err, result) {
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
    var sql = `SELECT * from utilisateur WHERE username = ?`;
    con.query(sql,[req.body.email], function (err, result) {
      if (result.length != 0) {
        req.session.error = "Un compte avec cet email existe déjà";
        res.redirect("/route/register?status=exist");
      } else {
        var hash = bcrypt.hashSync(`${req.body.password}`, salt);
        if (req.body.email && req.body.password) {
          var sql = `INSERT INTO utilisateur (username, motdepasse, role) VALUES (?,?,'admin')`;
          var value = [req.body.email, hash]
          con.query(sql,value, function (err, result) {
            if (err) throw err;
            console.log("1 record inserted");
            req.session.validate = "Votre compte a bien été créé";
            res.redirect("/");
          });
        } else {
          req.session.error = "Email ou mot de passe incorrect";
          res.redirect("/route/register?status=error");
        }
      }
    });
  });

  // route for dashboard
  router.get("/dashboard", (req, res) => {
    if (req.session.user) {
      con.query(`SELECT * FROM question INNER JOIN theme ON question.id_theme = theme.id`, function (err, result) {
        if (err) throw err;
        if (req.query.valid) {
          res.locals.valid = "Votre question a bien été créée";
        }
        res.render("dashboard", {
          user: req.session.user,
          listResults: result,
        });
      });
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
          logout: "déconnexion réussie...!",
        });
      }
    });
  });
});
module.exports = router;
