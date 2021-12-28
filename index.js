var express = require("express");
const mysql = require("mysql");
var bodyParser = require('body-parser')
var app = express();


app.use(express.static("public"));

app.use(bodyParser.urlencoded({
  extended: true
}));

// parse application/json
app.use(bodyParser.json())

app.set("view engine", "ejs");
app.set("views", "./views");

app.listen(3000);

const con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "password",
  database: "supereuro",
});

con.connect(function (err) {
  if (err) throw err;
  console.log("Connecté à la base de données MySQL!");

  app.get("/", function (request, response) {
    con.query(
      "SELECT * FROM question JOIN theme on question.id_theme = theme.id",
      function (err, result) {
        if (err) throw err;
        response.render("homePage");
      }
    );
  });

  app.get("/test", function (request, response) {
    response.render("testPage");
  });

  app.get("/login", function (request, response) {
    response.render("login");
  });

  app.post("/login", function (request, response) {
    console.log(request.body);
    response.redirect("/");
  });
});
