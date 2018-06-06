var Elm = require('./elm/Main.elm');

window.onload = function () {
    var node = document.getElementById('main');
    var app = Elm.Main.embed(node);
}