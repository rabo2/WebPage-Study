/**
 * 
 */

// 게시글 저장
function writeServer(){
   
     $.ajax({
         url: '/board/Write',
         type: 'post',
         data: $('form').serializeArray(),
         success: function(res) {
            if (res.sw == 'ok') {
               alert("게시글이 등록되었습니다.");
               $('#wModal').modal('hide');
            } else {
               alert("게시글 등록에 실패했습니다.")
            }
            //리스트 출력
            listServer(1);
         },
         error: function(xhr) {
            alert(xhr.status);
         },
         dataType: 'json'

      })

   }

   //리스트 출력
   listServer = function(page) {
      $.ajax({
         url: '/board/List',
         type: 'post',
         data: { 'page': page },
         success: function(res) {
          // BS-collapse_Accordion게시판 형태로 출력
          code = '<div class="panel-group" id="accordion">';
          $.each(res.datas, function(i, v){
             code += ' <div class="panel panel-default">';
             code += '   <div class="panel-heading">';
             code += '     <h4 class="panel-title">';
             code += '       <a idx="'+v.num+'" class="list" data-toggle="collapse" data-parent="#accordion" href="#collapse' + v.num + '">';
             code +=        v.subject + '</a>';
             code += '     </h4>';
             code += '   </div>';
             code += '   <div id="collapse' + v.num + '" class="panel-collapse collapse">';
             code += '     <div class="panel-body pbody">';
             code += '      <p class="p1">작성자 : ' + v.writer + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
             code += '         조회수 : ' + v.hit + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
             code += '         날  짜 : ' + v.wdate + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
             code += '      </p>';
             code += '      <p class="p2">';
             code += '         <input idx="' + v.num + '" type="button" name="modify" value="수정" class="action">';
             code += '         <input idx="' + v.num + '" type="button" name="delete" value="삭제" class="action">';
             code += '      </p>';
             code += '      <p class="p3">' + v.cont + '</p>';
             
             
             // 댓글구간 시작
             code += '<p class="p4">';
             code += '<textarea cols="100"></textarea>';
             code += '<input idx="' + v.num + '" type="button" value="등록" name="reply" class="action">';
             code += '</p>';
             // 댓글구간 끝
             code += '      </div>';
             code += '   </div>';
             code += ' </div>';
             code += '</div>';
          })
          code +='</div>';
          $('#list').html(code);
          
          // 페이지 리스트 - BS_pagination pager 활용
          pager = '<div class="container">';
          // 이전버튼(Prev)
          if (res.sp > 1) {
            pager += '<ul class="pager">';
            pager += '<li><a class="prev" href="#">Prev</a></li></ul>';
         }
          // 페이지 번호 출력
          pager += '  <ul class="pagination pager">';
          for (var i = res.sp; i <= res.ep; i++) {
             if (currentPage == i) {
                pager += '<li class="active"><a class="paging" href="#">' + i + '</a></li>';
            }else {
               pager += '<li><a class="paging" href="#">' + i + '</a></li>';
            }
         }
          pager += '  </ul>';
          // 다음버튼(Next)
          if (res.ep < res.tp) {
            pager += '<ul class="pager">';
            pager += '<li><a class="next" href="#">Next</a></li></ul>';
         }

          pager += '</div>';
          $('#pagelist').html(pager);
         },
         error: function(xhr) {
            alert(xhr.status);
         },
         dataType: 'json'
      })
   }
   
   // 댓글 저장
   replyServer = function(btn){
      
      $.ajax({
         url : '/board/ReplySave',
         type : 'post',
         data : reply, // 객체 - bonum, name, cont 항목이 존재
         success      : function(res){
            if (res.sw == 'no') {
               alert("댓글 등록에 실패하였습니다.")
               return;
            }
            // 성공시 댓글조회리스트로 이동
            replyListServer(btn);
         },
         error : function(xhr){
            alert(xhr.status);
         },
         dataType : 'json'
      })
   }
   
   // 댓글리스트 조회
   replyListServer = function(btn){   // reply_btn
      $.ajax({
         url : '/board/ReplyList',
         data : {'bonum' : vidx},
         success : function(res){
            code = '';
            $.each(res, function(i, v){
//         		$(btn).parents('.panel').find('.rep').remove();   // 제목을 클릭하였을때 댓글리스트 보이기의 중복방지
                code += '<div class="panel-body rep">';
                code += '<p class="p1">작성자 : ' + v.name + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                redate = v.redate.substr(0, 10);
                code += '            날  짜 : ' +  redate + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                code += '</p>';
                code += '<p class="p2">';
                code += '<input idx="' + v.renum + '" type="button" name="r_modify" value="댓글수정" class="action">';
                code += '<input idx="' + v.renum + '" type="button" name="r_delete" value="댓글삭제" class="action">';
                code += '</p>';
                code += '<p class="cont p3">' + v.cont + '</p>';
                code += '</div>';
            })
            $(btn).parents('.panel').find('.pbody').append(code);
         },
         error : function(xhr){
            alert(xhr.status);
         },
         dataType   : 'json'
         
      })
   }
   
   
replyDelete = function () {
	$.ajax({
		url : '/board/RelplyDelete',
		data : {'renum' : vidx},
		success: function() {
		},
		error: function() {
		}
	})
};


//댓글 수정이 열린 상태에서 다른 곳의 댓글 수정을 누를 경우 현재의 댓글 수정창이 사라지는 현상
//해결 - 수정창은 사라지지만 내용은 남아있도록 처리하기
replyReset = function(){
    contp3 = $('#modifyForm').parent();   // cont p3접근
    
    // modifyForm을 다시 body에 append
    $('#modifyForm').appendTo('body');
    $('#modifyForm').hide();
    
    // 원래 내용을 contp3에 다시 출력
    modifyCont.replace(/\n/g, "<br>");
    $(contp3).html(modifyCont);
    
 };
 
 replyUpdate = function(reply) {
	$.ajax({
		url : '/board/ReplyUpdate',
		type : 'post',
		data : reply,
		dataType : 'json'
	});
}
   