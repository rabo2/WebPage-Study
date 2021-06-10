//리터럴 이용
function proc1(){
   fruit = ['banana', 'apple',100, 'waterMelon',12.45, 'grape'];

   print('rst1');
}


//생성자 이용
function proc2(){
  fruit = new Array();
  fruit[0] = "자두";
  fruit[1] = "사과";
  fruit[2] = "오렌지";
  fruit[3] = "딸기";
  fruit[4] = "샤인머스켓";

  print("rst2");

  document.getElementById('rst2').innerHTML = str;
}

//생성자 배열 생성1
function proc3(){
  fruit = new Array("참외", "수박", "포도", "멜론", "토마토");
  print('rst3');
}

function print(rst){
  str = "";
  for(i = 0; i < fruit.length; i++){
    str+= fruit[i] + " ";
  }

  document.getElementById(rst).innerHTML = str;
}
