var Elm = require('./elm/Main.elm');

var node = document.getElementById('main');
console.log(Elm);
var app = Elm.Main.embed(node);
