<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
    
}

ul.tabs li{
  display: inline-block;
	background: #A8B0FF;
	color: white;
	padding: 10px 15px;
	cursor: pointer;
    
}

ul.tabs li.current{
	background: #e0e0e0;
	color: #222;
}

.tab-content{
  display: none;
	background: #e0e0e0;
	padding: 12px;
   
}

.tab-content.current{
	display: inherit;
}
.container{
    width: 90%;
}


 
  </style>
</head>
<body>
	

	<div><h2>나의 파티</h2></div>
	
	<jsp:include page="../myPage/myPageMenubar.jsp"/>
	<hr>
	<br>

    <div class="container">
        <!-- 탭 메뉴 상단 시작 -->
            <ul class="tabs">
                <li class="tab-link current" data-tab="tab-1">참여파티</li>
                <li class="tab-link" data-tab="tab-2">생성파티</li>
                
            </ul>
        <!-- 탭 메뉴 상단 끝 -->
        <!-- 탭 메뉴 내용 시작 -->
            <div id="tab-1" class="tab-content current">
            
            <div class="empty">
                <p>참여중인 파티가 없습니다.</p>
            </div>

            <div>
                
            </div>
        
        
            </div>
            <div id="tab-2" class="tab-content">
            <p>생성중인 파티가 없습니다.</p>
        
            <div>

            </div>

            </div>
        <!-- 탭 메뉴 내용 끝 -->
        </div>

        <script>
            $(document).ready(function(){
	
            $('ul.tabs li').click(function(){							//선택자를 통해 tabs 메뉴를 클릭 이벤트를 지정해줍니다.
                var tab_id = $(this).attr('data-tab');

                $('ul.tabs li').removeClass('current');			//선택 되있던 탭의 current css를 제거하고 
                $('.tab-content').removeClass('current');		

                $(this).addClass('current');								////선택된 탭에 current class를 삽입해줍니다.
                $("#" + tab_id).addClass('current');
            })

            });
        </script>
</body>
</html>
