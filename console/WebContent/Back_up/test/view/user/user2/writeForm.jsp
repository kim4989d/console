<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>▒▒▒▒▒▒▒▒ VACCS ▒▒▒▒▒▒▒▒</title>
<link href="/ngs/comm/css/default.css" rel="stylesheet" type="text/css">
<link href="/ngs/comm/css/Form.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>

<script language="javascript">

	function openReg(url){
		opener.location = url;
		opener.parent.location.reload(); 
		parent.close();
		//top.document.target.location.reload();
		//window.close();
		//top.showframe.location=url; 
		//opener.frames.showframe.location.reload();
		
		
	}

	function target_frame(url){
		top.target.location = url;
		}
	
 </script>
</head>

<% 
  int unix_num=0, unix_ref=1, unix_re_step=0;
  try{  
	if(request.getParameter("unix_num")!=null){
		unix_num	=	Integer.parseInt(request.getParameter("num"));
		unix_ref	=	Integer.parseInt(request.getParameter("unix_ref"));
		unix_re_step=	Integer.parseInt(request.getParameter("unix_re_step"));
	}
%>
   
   
<body>  
<center>
<b>작업내역 등록</b>

<form method="post" name="writeform" action="writePro.jsp" onsubmit="return writeSave()">
<input type="hidden" name="num" value="<%=unix_num%>">
<input type="hidden" name="ref" value="<%=unix_ref%>">
<input type="hidden" name="re_step" value="<%=unix_re_step%>">


<table width="610" border="1" cellspacing="0" cellpadding="0" align="center">  
  <tr>
    <td  width="70" align="center" >작업목적</td>
    <td  width="330"><input type="text" size="50" maxlength="50" name="unix_object"></td>
  </tr> 

	<!-- scriptCalendar 가져온다. -->
  <tr>
    <td  width="70" align="center">작업시간</td>
    <td  width="400">
	    <select name="dd1">
		      <option value="오늘" >오늘</option>
		      <option value="내일" >내일</option>
		      <option value="기타" >기타</option>
	    </select>
		<select name="hh1">
		      <option value="00" >00</option>
		      <option value="01" >01</option>
		      <option value="02" SELECTED>02</option>
		      <option value="03" >03</option>
		      <option value="04" >04</option>
		      <option value="05" >05</option>
		      <option value="06" >06</option>
		      <option value="07" >07</option>
		      <option value="08" >08</option>
		      <option value="09" >09</option>
		      <option value="10" >10</option>
		      <option value="11" >11</option>
		      <option value="12" >12</option>
		      <option value="13" >13</option>
		      <option value="14" >14</option>
		      <option value="15" >15</option>
		      <option value="16" >16</option>
		      <option value="17" >17</option>
		      <option value="18" >18</option>
		      <option value="19" >19</option>
		      <option value="20" >20</option>
		      <option value="21" >21</option>
		      <option value="22" >22</option>
		      <option value="23" >23</option>
		</select> 시
		<select name="mm1">

              <option value="01">01</option>
              <option value="02">02</option>
              <option value="03">03</option>
              <option value="04">04</option>
              <option value="05">05</option>
              <option value="06">06</option>
              <option value="07">07</option>
              <option value="08">08</option>
              <option value="09">09</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
              <option value="13">13</option>
              <option value="14">14</option>
              <option value="15">15</option>
              <option value="16">16</option>
              <option value="17">17</option>
              <option value="18">18</option>
              <option value="19">19</option>
              <option value="20">20</option>
              <option value="21">21</option>
              <option value="22">22</option>
              <option value="23">23</option>
              <option value="24">24</option>
              <option value="25">25</option>
              <option value="26">26</option>
              <option value="27">27</option>
              <option value="28">28</option>
              <option value="29">29</option>
              <option value="30">30</option>
              <option value="31">31</option>
              <option value="32">32</option>
              <option value="33">33</option>
              <option value="34">34</option>
              <option value="35">35</option>
              <option value="36">36</option>
              <option value="37">37</option>
              <option value="38">38</option>
              <option value="39">39</option>
              <option value="40">40</option>
              <option value="41">41</option>
              <option value="42">42</option>
              <option value="43">43</option>
              <option value="44">44</option>
              <option value="45">45</option>
              <option value="46">46</option>
              <option value="47">47</option>
              <option value="48">48</option>
              <option value="49">49</option>
              <option value="50">50</option>
              <option value="51">51</option>
              <option value="52">52</option>
              <option value="53">53</option>
              <option value="54">54</option>
              <option value="55">55</option>
              <option value="56">56</option>
              <option value="57">57</option>
              <option value="58">58</option>
              <option value="59">59</option>
      </select>분 ~ 
      
      	    <select name="hh2">
		      <option value="오늘" >오늘</option>
		      <option value="내일" >내일</option>
		      <option value="기타" >기타</option>
	    </select>
	    		<select name="hh2">
		      <option value="00" >00</option>
		      <option value="01" >01</option>
		      <option value="02" SELECTED>02</option>
		      <option value="03" >03</option>
		      <option value="04" >04</option>
		      <option value="05" >05</option>
		      <option value="06" >06</option>
		      <option value="07" >07</option>
		      <option value="08" >08</option>
		      <option value="09" >09</option>
		      <option value="10" >10</option>
		      <option value="11" >11</option>
		      <option value="12" >12</option>
		      <option value="13" >13</option>
		      <option value="14" >14</option>
		      <option value="15" >15</option>
		      <option value="16" >16</option>
		      <option value="17" >17</option>
		      <option value="18" >18</option>
		      <option value="19" >19</option>
		      <option value="20" >20</option>
		      <option value="21" >21</option>
		      <option value="22" >22</option>
		      <option value="23" >23</option>
		</select> 시
		<select name="mm2">

              <option value="01">01</option>
              <option value="02">02</option>
              <option value="03">03</option>
              <option value="04">04</option>
              <option value="05">05</option>
              <option value="06">06</option>
              <option value="07">07</option>
              <option value="08">08</option>
              <option value="09">09</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
              <option value="13">13</option>
              <option value="14">14</option>
              <option value="15">15</option>
              <option value="16">16</option>
              <option value="17">17</option>
              <option value="18">18</option>
              <option value="19">19</option>
              <option value="20">20</option>
              <option value="21">21</option>
              <option value="22">22</option>
              <option value="23">23</option>
              <option value="24">24</option>
              <option value="25">25</option>
              <option value="26">26</option>
              <option value="27">27</option>
              <option value="28">28</option>
              <option value="29">29</option>
              <option value="30">30</option>
              <option value="31">31</option>
              <option value="32">32</option>
              <option value="33">33</option>
              <option value="34">34</option>
              <option value="35">35</option>
              <option value="36">36</option>
              <option value="37">37</option>
              <option value="38">38</option>
              <option value="39">39</option>
              <option value="40">40</option>
              <option value="41">41</option>
              <option value="42">42</option>
              <option value="43">43</option>
              <option value="44">44</option>
              <option value="45">45</option>
              <option value="46">46</option>
              <option value="47">47</option>
              <option value="48">48</option>
              <option value="49">49</option>
              <option value="50">50</option>
              <option value="51">51</option>
              <option value="52">52</option>
              <option value="53">53</option>
              <option value="54">54</option>
              <option value="55">55</option>
              <option value="56">56</option>
              <option value="57">57</option>
              <option value="58">58</option>
              <option value="59">59</option>
      </select>분 
               
    </td>
  </tr> 
  
  <!-- FTP 상용/미사용 -->
  <tr>
    <td  width="70" align="center">FTP 사용</td>
    <td  width="330">
    <input type="radio">사용
     <input type="radio" checked="checked">미사용</td>
  </tr> 
  
  <!-- 작업시스템 -->
  <tr>
    <td align="center">작업시스템</td>
    
    <td align="center">
    <iframe width="530" height="150" name="target" src="work_sys_default.jsp"></iframe>
    <br>
    	<input type="button" value="추가" onClick="target_frame('work_sys_list.jsp')">   
    </td>    
    
  </tr>        
   <tr>      
	 <td colspan=2 align="center"> 
	 <!-- 최초 작업 등록시 새로고침 안되는 문제 발생. -->
	  <input type="submit" value="등록" onclick="parent.opener.location.reload();parent.close();">  
	  <input type="submit" value="닫기" onclick="javascript:window.close();">  
	</tr>

</table>    
 <%
  }catch(Exception e){}
%>     
</form>      

</center>
</body>
</html>      
