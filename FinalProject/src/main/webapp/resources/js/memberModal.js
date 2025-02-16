function decBtnClick(userNickname){
 	console.log($("#modal-nickName").val());
	if($("#modal-nickName").val() != userNickname){
       $(".declaration").css("display","block");
       $("#modal .modal-window").css("height","530px");
    }else{
    	alert("회원님을 신고를 할 수 없습니다!");
    }
}


        	
$("#dec-close").on("click",function(){
       $(".declaration").css("display","none");
       $("#dec-textarea").val("");
       $("#modal .modal-window").css("height","220px");
});
        	
$(".close-area").on("click",function(){
       $("#modal").css("display","none");
       $(".declaration").css("display","none");
       $("#dec-textarea").val("");
       $("#modal .modal-window").css("height","220px");
});

//모달창 외부 영역 클릭시 닫힘
$(document).mouseup(function (e){
	var container = $('#modal');
	if( container.has(e.target).length === 0){
		container.css('display','none');
		$(".declaration").css("display","none");
		$("#dec-textarea").val("");
		$("#modal .modal-window").css("height","220px");
	}
});

function memModalOpen(userNickname){
	console.log(userNickname);
	$.ajax({
		url : "find.mo",
		type : "post",
		data : {
			clickNickName : userNickname
		},
		success : function(result){
			$("#modal-nickName").html("회원 닉네임 : "+result.userNickName);
			$("#modal-nickName").val(result.userNickName);
			$("#modal-level").html("회원 등급 : "+result.userLevel);
			$("#decl-id").html("신고할 회원 닉네임 : "+result.userNickName);
		},
		error : function(){
			console.log("통신 에러");
		}
	});
	$(".modal-window").css("display","block");
	$("#modal.modal-overlay").css("display","flex");
}

function declInsert(){
	if($("#dec-textarea").val().replace(/\n$/g,"").trim()!="" && $("#dec-textarea").val().trim()!=""){
		$.ajax({
			url : "deInsert.mo",
			type : "post",
			data : {
				reporter : "admin", //로그인한 유저 닉네임 넣기
				reported : "유저원", ////모달창의 회원 닉네임 넣기
				reportContent : $("#dec-textarea").val().replace(/\n$/g,"").trim()
			},
			success : function(result){
				if(result == "NNNNY"){
					alert("신고가 정상적으로 접수되었습니다!");
				}else{
					alert("신고 접수에 실패하였습니다!");
				}
				$(".declaration").css("display","none");
	       		$("#dec-textarea").val("");
	       		$("#modal .modal-window").css("height","220px");
			},
			error : function(){
				console.log("통신 에러");
			}
		});
	}else{
		$("#dec-textarea").val("");
		alert("신고 내용을 입력하세요!");
	}
}
