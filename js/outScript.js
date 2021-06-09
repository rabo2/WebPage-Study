/*



*/

function proc(){
  var now = new Date();
  var vdiv = document.getElementsByTagName('div')[0];
  str = now.toLocaleDateString()+"<br><hr><br>";
  str += now.toLocaleTimeString();
  vdiv.innerHTML = str;
  //innerHTML은 태그를 포함하는 문자열을 저장할 수 있다.
}


function change(){
  var vdiv = document.getElementsByTagName('div')[0];
  //10진수 색상표현
  var red = parseInt(Math.random()*256);
  var green = parseInt(Math.random()*256);
  var blue = parseInt(Math.random()*256);

  // console.log(red, green, blue);
  r16 = red.toString(16);
  g16 = green.toString(16);
  b16 = blue.toString(16);
  // vdiv.style.background = "rgb("+red+", "+ green+", "+blue+")";
  vdiv.style.background = "#"+r16+g16+b16;
}
