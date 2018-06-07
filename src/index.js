import css from './style.scss';
import Elm from './elm/Main.elm';

var node = document.getElementById('main');
console.log(Elm);
var app = Elm.Main.embed(node);
