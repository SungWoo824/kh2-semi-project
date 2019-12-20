<%@page import="beans.HostelDao"%>
<%@page import="beans.VisitDao"%>
<%@page import="java.util.*"%>
<%@page import="beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   		MemberDao mdao = new MemberDao();
    	HostelDao hdao = new HostelDao();
   	 	List<String[]> registUser = mdao.userJoindateSearch();
   	 	List<String[]> registOwner = mdao.ownerJoindateSearch();
   	 	List<String[]> registHostel = hdao.hostelRegistDateSearch();
   		int todayVisit;
   		int totalVisit;
   		if(session.getAttribute("todayCount")==null){
   			todayVisit=0;
   		}else{
   			todayVisit = (int)session.getAttribute("todayCount");
   		}
   		if(session.getAttribute("totalCount")==null){
   			totalVisit=0;
   		}else{
   			totalVisit = (int)session.getAttribute("totalCount");
   		}
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nav-menu.css">
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	function display(){
	    google.charts.load('current', {packages: ['corechart', 'bar']});
	    google.charts.setOnLoadCallback(todayUser);
	    google.charts.setOnLoadCallback(todayOwner);
	    google.charts.setOnLoadCallback(todayCustomer);
	    google.charts.setOnLoadCallback(todayHostel);
	
	    function todayUser() {
	          var data = new google.visualization.DataTable();
	          data.addColumn('timeofday', 'Time of Day');
	          data.addColumn('number', 'Motivation Level');
	          data.addColumn('number', 'Energy Level');
	
	        var dataArray = [];
	        
	        ///////////
	        dataArray.push(['Element', '사용자 가입수', { role: 'style' }]);
	        dataArray.push(['어제',<%=Integer.parseInt(registUser.get(1)[1]) %>, 'black']);
	        dataArray.push(['오늘',<%=Integer.parseInt(registUser.get(0)[1]) %>, 'silver']);
	        
	        ////////////////////
	        
	         var data = google.visualization.arrayToDataTable(dataArray);
	
	          var chart = new google.visualization.ColumnChart(document.getElementById('chart_div1'));
	          chart.draw(data);
	        }
	    function todayOwner() {
	          var data = new google.visualization.DataTable();
	          data.addColumn('timeofday', 'Time of Day');
	          data.addColumn('number', 'Motivation Level');
	          data.addColumn('number', 'Energy Level');
	
	        var dataArray = [];
	        
	        ///////////
	        dataArray.push(['date', '판매자가입수', { role: 'style' }]);
	        dataArray.push(['어제', <%=Integer.parseInt(registOwner.get(1)[1]) %>, 'black']);
	        dataArray.push(['오늘', <%=Integer.parseInt(registOwner.get(0)[1]) %>, 'silver']);
	        
	        ////////////////////
	        
	         var data = google.visualization.arrayToDataTable(dataArray);
	
	          var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
	          chart.draw(data);
	        }
	    function todayCustomer() {
	          var data = new google.visualization.DataTable();
	          data.addColumn('timeofday', 'Time of Day');
	          data.addColumn('number', 'Motivation Level');
	          data.addColumn('number', 'Energy Level');
	
	        var dataArray = [];
	        
	        ///////////
	        dataArray.push(['Element', '회원가입수', { role: 'style' }]);
	        dataArray.push(['총접속자수', <%=todayVisit %>, 'black']);
	        dataArray.push(['오늘접속자수', <%=totalVisit %>, 'silver']);
	        
	        ////////////////////
	        
	         var data = google.visualization.arrayToDataTable(dataArray);
	
	          var chart = new google.visualization.ColumnChart(document.getElementById('chart_div3'));
	          chart.draw(data);
	       }
	    function todayHostel() {
	          var data = new google.visualization.DataTable();
	          data.addColumn('timeofday', 'Time of Day');
	          data.addColumn('number', 'Motivation Level');
	          data.addColumn('number', 'Energy Level');
	
	        var dataArray = [];
	        
	        ///////////
	        dataArray.push(['Element', '회원가입수', { role: 'style' }]);
	        dataArray.push(['어제등록된숙소', <%=Integer.parseInt(registOwner.get(1)[1])%>, 'black']);
	        dataArray.push(['오늘등록된숙소',<%=Integer.parseInt(registOwner.get(0)[1]) %>, 'silver']);
	        
	        ////////////////////
	        
	         var data = google.visualization.arrayToDataTable(dataArray);
	
	          var chart = new google.visualization.ColumnChart(document.getElementById('chart_div4'));
	          chart.draw(data);
	       }
	   
	}
</script>
<body onload="display();">
<jsp:include page="../template/nav.jsp"></jsp:include>
<div class="w-80">
	<div><h2>그림</h2></div>
	<div class="row-big"></div>
	<div class="row-big"></div>
	<div class="row-big"></div>
	<jsp:include page="../template/master_menu_template.jsp"></jsp:include>
	<div class="master">
		<div class="master-list">
			<div class="master-list-item">
				<div>
					<h4>오늘 가입한 사용자</h4>
					<h3><%=registUser.get(0)[1] %> 명</h3>
					<div id="chart_div1"></div>
				</div>
				
			</div>
		</div>
		<div class="master-list">
			<div class="master-list-item">
				<div>
					<h4>오늘 가입한 판매자</h4>
					<h3><%=registOwner.get(0)[1] %> 명</h3>
				</div>
				<div id="chart_div2"></div>
			</div>			
		</div>
		<div class="master-list">
			<div class="master-list-item">
				<div>
					<h4>오늘 등록된 숙소</h4>
					<h3><%=registHostel.get(0)[1] %> 개</h3>
				</div>
				<div id="chart_div4"></div>			
			</div>
		</div>
		<div class="master-list">
			<div class="master-list-item">
				<div>
					<h4>오늘 방문자</h4>
					<h3><%=todayVisit %> 명</h3>
				</div>
				<div id="chart_div3"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>