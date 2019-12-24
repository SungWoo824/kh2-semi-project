<%@page import="beans.MemberDto"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <title>마이페이지</title>

<style>
@font-face {
    font-family: binggrae;
    src: url("./font/Binggrae.ttf");
}

@font-face {
    font-family: binggrae2;
    src: url("./font/BinggraeⅡ-Bold.ttf");
}

@font-face {
    font-family: melonabold;
    src: url("./font/BinggraeMelona-Bold.ttf");
}

@font-face {
    font-family: movie;
    src: url("./font/DXMSubtitlesM-KSCpc-EUC-H.ttf");
}
        * {
            box-sizing: border-box;
             font-family: melonabold;
             color: dimgray;
        
        }
    .all{
         
            background-repeat: no-repeat;
            background-size: 120% 100%;
            background-position: center center;
        margin: auto;
    }
        
    
    
    .mypage {
            /*            border: 1px dotted black;*/
            width: 460px;
            margin: 30px auto;
            text-align: left;
          
           
		
        }





        .mypage>* {
            width: 100%;
            margin: 15px 0px;

        }

        .mypage>.mypage-class {
            border: 1px solid gray;
        }

        .mypage>table[id=a] {
            background-image: url("../image/icon1.png");
            background-repeat: no-repeat;
            background-size: 50px 50px;
            background-position: 400px 14px;
        }

        .mypage>table[id=b] {
            background-image: url("../image/icon2.png");
            background-repeat: no-repeat;
            background-size: 50px 50px;
            background-position: 400px 14px;
        }

        .mypage>table[id=c] {
            background-image: url("../image/icon3.png");
            background-repeat: no-repeat;
            background-size: 50px 50px;
            background-position: 400px 14px;
        }

        .mypage>table[id=d] {
            background-image: url("../image/icon4.png");
            background-repeat: no-repeat;
            background-size: 50px 50px;
            background-position: 400px 14px;
        }

        .mypage>table[id=e] {
            background-image: url("../image/icon5.png");
            background-repeat: no-repeat;
            background-size: 50px 50px;
            background-position: 400px 14px;
        }

        .mypage>table[id=f] {
        	
            background-image: url("../image/icon6.png");
            background-repeat: no-repeat;
            background-size: 50px 50px;
            background-position: 400px 14px;
        }
    </style>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/footer.css">
   
</head>

<body class="all">
<div>
<jsp:include page="/template/nav.jsp"></jsp:include>
</div>
    <div class="mypage">
 <div class="master-title w-100"><h2>MYPAGE</h2></div>



        <table class="mypage-class" id="a">

            <tr>
                <td>

                    <h4><a href="order/list.jsp">예약내역 조회</a></h4>

                </td>
            </tr>


        </table>




        <table class="mypage-class" id="b">

            <tr>
                <td>

                    <h4><a href="../member/info.jsp">회원 정보</a></h4>

                </td>
            </tr>


        </table>





        <table class="mypage-class" id="c">

            <tr>
                <td>

                    <h4><a href="wish_list.jsp">관심 상품</a></h4>

                </td>
            </tr>


        </table>




        <table class="mypage-class" id="d">

            <tr>
                <td>

                    <h4><a href="coupon/list.jsp">쿠폰</a></h4>

                </td>
            </tr>


        </table>




        <table class="mypage-class" id="e">

            <tr>
                <td>

                    <h4><a href="board_list.jsp">게시물 관리</a></h4>

                </td>
            </tr>


        </table>





        <table class="mypage-class" id="f">

            <tr>
                <td>

                    <h4><a href="#">주소 관리</a></h4>

                </td>
            </tr>


        </table>





    </div>

 	<div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
           

</body>

	</html>
