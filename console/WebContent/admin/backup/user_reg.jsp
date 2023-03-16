<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<!-- 팝업사이즈  1000 * 516-->
<title>팝업_NGS 사용자관리_사용자등록</title>
<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
<META NAME="CONTENT-LANGUAGE" CONTENT="KR">
<LINK REL='STYLESHEET' HREF='../../../css/skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='../../../css/skt_Default.css' TYPE='TEXT/CSS'>
<style type="text/css">
<!--
.style1 {
	font-size: 11px
}
-->
</style>
</head>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<body>
<table width=1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="46" background="../../../images/pop_1000bg_01.jpg" class="PopupTitleBgWhite"><img src="../../../images/pop_img01.gif" width="8" height="17" align="absmiddle" style="margin-left:10px; margin-right:10px">NGS 사용자 등록</td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
  <tr>
    <td><table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="5"></td>
          <td width="790" height="4" bgcolor="#9ab1cf"></td>
          <td width="5"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <colgroup>
              <col width="50%">
              <col width="*">
              </colgroup>
              <tr>
                <td height="30" colspan="2" class="PopupLine"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td class="OrangeText"><strong>사용자 정보</strong></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table border="0" cellspacing="0" cellpadding="0">
                          <colgroup>
                          <col width="100">
                          <col width="*">
                          </colgroup>
                          <tr>
                            <td height="30" class="PopupBold">사용자 ID </td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="uid" type="text" class="inputLIneGrayColor" size="23" maxlength="13" /></td>
                                  <td>&nbsp;<a href="#"><img src="../../../images/btn_id_check.gif" align="absmiddle"></a></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold" >암호</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="pwd1" type="password" class="inputLIneGrayColor" size="23" maxlength="10"></td>
                                  <td>&nbsp;<span class="style1">영문 숫자 조합 8자리로 입력 해주세요</span></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">암호확인</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="pwd2" type="password" class="inputLIneGrayColor" size="23" maxlength="10" /></td>
                                  <td>&nbsp;<span class="style1">위에 입력하신 암호를 동일하게 입력하세요. </span></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">사용자 유형</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="uKind" class="InputLIneSelect" onChange="uKindChange();change_menu(this.form.uKind.value)">
                                      <option value ="">선택</option>
                                      <option value ="O">운용자</option>
                                      <option value ="G" selected="selected">일반사용자</option>
                                      <option value ="M">유지보수작업자</option>
                                    </select></td>
                                  <td></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">신청목적</td>
                            <td  class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="object" type="text" class="inputLIneGrayColor" size="50" maxlength="50">
                                    <img src="../../../images/dot_2.gif" align="absmiddle"><FONT COLOR="ff3116">필수</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="BlueText"><strong>소속사</strong></td>
                            <td><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="company" class="InputLIneSelect">
                                      <option value ="">선택</option>
                                      <option value="ABLECOM">에이블컴</option>
                                      <option value="ADS">앞선데이타시스템</option>
                                      <option value="AHNLAB">안철수연구소</option>
                                      <option value="AIRCROSS">에어크로스</option>
                                      <option value="ATSolution">ATSolution</option>
                                      <option value="BLUEDIGM">블루다임</option>
                                      <option value="BNSWORKS">BNSWORKS</option>
                                      <option value="BTBSoluti">BTB솔루션</option>
                                      <option value="CASSIS">CASSIS</option>
                                      <option value="CITYGAME">시티게임</option>
                                      <option value="CP">커머스플래닛</option>
                                      <option value="DONGDEUK">동덕정보통신</option>
                                      <option value="EASYMON">이지몬</option>
                                      <option value="EFOTEK">이포텍</option>
                                      <option value="EMC">EMC</option>
                                      <option value="ENCOREPLUS">엔코아플러스</option>
                                      <option value="FORCS">포시에스</option>
                                      <option value="GTPLUS">GT플러스</option>
                                      <option value="HAEORUM">해오름</option>
                                      <option value="HP">HP</option>
                                      <option value="IBM">IBM</option>
                                      <option value="ICENT">아이센트</option>
                                      <option value="ICONLAB">아이콘랩</option>
                                      <option value="IGLOOSEC">이글루시큐리티</option>
                                      <option value="IMC">IMC</option>
                                      <option value="INFOSEC">인포섹</option>
                                      <option value="INNOTECH">이노테크</option>
                                      <option value="INSOFT">아이엔소프트</option>
                                      <option value="INZEN">인젠</option>
                                      <option value="ITPlus">ITPlus</option>
                                      <option value="IWT">아이더블유티</option>
                                      <option value="JAEUNGTECH">재웅테크</option>
                                      <option value="KEY2NET">KEY2NET</option>
                                      <option value="KOREANET">코리아네트</option>
                                      <option value="KORNIC">코닉글로리</option>
                                      <option value="LINUXONE">리눅스원</option>
                                      <option value="MANTECH">맨텍</option>
                                      <option value="MCURIX">엠큐릭스</option>
                                      <option value="Microsoft">Microsoft인성정보</option>
                                      <option value="NCODING">엔코딩패스</option>
                                      <option value="NEXTCODE">넥스트코드</option>
                                      <option value="NEXTGATE">넥스게이트</option>
                                      <option value="NKIA">엔키아</option>
                                      <option value="NOKIA">노키아</option>
                                      <option value="PIXBYTE">픽스바이트</option>
                                      <option value="PSYNET">사이넷</option>
                                      <option value="QCOM">큐컴</option>
                                      <option value="RATHONTECH">라톤테크</option>
                                      <option value="ROCKPLACE">락플레이스</option>
                                      <option value="RSUPPORT">알스포트</option>
                                      <option value="SIGMAINFO">시그마정보통신</option>
                                      <option value="SKCC">SK C&amp;C</option>
                                      <option value="SKTelecom">SKTelecom</option>
                                      <option value="SVL">SVL</option>
                                      <option value="TGCORP">티지코프</option>
                                      <option value="UCLICK">유클릭</option>
                                      <option value="XEST">제스트정보기술</option>
                                      <option value="ZESPRO">제스프로</option>
                                      <option value="cipher_cas">싸이퍼캐스팅</option>
                                      <option value="solvix">솔빅스</option>
                                      <option value="varobision">바로비젼</option>
                                    </select></td>
                                  <td><img src="../../../images/dot_2.gif" align="absmiddle" /><FONT COLOR="ff3116">필수</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                      <td valign="top"><table border="0" cellspacing="0" cellpadding="0">
                        <colgroup>
                        <col width="100">
                        <col width="*">
                        </colgroup>
                        <tr>
                          <td height="30" class="PopupBold">휴대폰</td>
                          <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><select name="hp4" size="1" class="InputLIneSelect">
                                    <option value ="">선택하세요</option>
                                    <option value ="011">011</option>
                                    <option value ="016">016</option>
                                    <option value ="017">017</option>
                                    <option value ="018">018</option>
                                    <option value ="019">019</option>
                                    <option value ="010" selected="selected">010</option>
                                  </select>
                                  -
                                  <input name="hp4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" />
                                  -
                                  <input name="hp4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" />
                                  <input name="isported2" type="checkbox" value="1" />
                                  <span class="style1">번호이동일 경우 체크</span><img src="../../../images/dot_2.gif" align="absmiddle"><font color="ff3116">필수</font></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="30" class="PopupBold">회사전화</td>
                          <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><select name="tel4" class="InputLIneSelect">
                                    <option value=''>선택하세요</option>
                                    <option value='02' >02</option>
                                    <option value='031'>031</option>
                                    <option value='032'>032</option>
                                    <option value='033'>033</option>
                                    <option value='041'>041</option>
                                    <option value='042'>042</option>
                                    <option value='043'>043</option>
                                    <option value='051'>051</option>
                                    <option value='052'>052</option>
                                    <option value='053'>053</option>
                                    <option value='054'>054</option>
                                    <option value='055'>055</option>
                                    <option value='061'>061</option>
                                    <option value='062'>062</option>
                                    <option value='063'>063</option>
                                    <option value='064'>064</option>
                                  </select>
                                  -
                                  <input name="tel4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" />
                                  -
                                  <input name="tel4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" /></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="30" class="PopupBold">팩스</td>
                          <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><input name="fax4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" />
                                  -
                                  <input name="fax4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" />
                                  -
                                  <input name="fax4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" /></td>
                                <td class="T11PopupText">&nbsp;</td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="30" class="PopupBold">이름</td>
                          <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><input name="uname2" type="text" class="inputLIneGrayColor" size="23" maxlength="20" style = "ime-mode:inable" /></td>
                                <td class="T11PopupText"><img src="../../../images/dot_2.gif" align="absmiddle" /><font color="ff3116">필수</font></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="30" class="PopupBold">담당자</td>
                          <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><select name="oper2" class="InputLIneSelect" style="width:110" onChange="change_service(this.form.oper.value,this.form.company.value)">
                                    <option value=''>사용자유형선택</option>
                                  </select>                                </td>
                                <td class="T11PopupText"><img src="../../../images/dot_2.gif" align="absmiddle" /><font color="ff3116">필수</font> <span class="style1">(매니저를 선택하세요.)</span> </td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="30" class="BlueText"><strong>접속별 유형</strong></td>
                          <td class="BlueText"><table width="405" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="100"><input type="radio" name="sType" value="C" checked id="str1">
                                  접속별승인</td>
                                <td width="250"><input type="radio" name="sType" value="P" id="str2">
                                  기간별승인</td>
                              </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="30" colspan="2" class="PopupLine"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="4" bgcolor="#9ab1cf">
                    </tr>
                    <tr>
                      <td height="30" class="OrangeText"><strong>장비신청 현황</strong></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <colgroup>
                    <col width="40%">
                    <col width="*">
                    </colgroup>
                    <tr>
                      <td><table border="0" cellspacing="0" cellpadding="0">
                          <colgroup>
                          <col width="100">
                          <col width="*">
                          </colgroup>
                          <tr>
                            <td class="BlueText"><strong>서비스 선택</strong></td>
                            <td><select name="company2" class="InputLIneSelect">
                                <option value ="">서비스를 선택하세요</option>
							    <option selected>서비스를 선택하세요 </option>
								  <option value="O/M" >O/M</option>
								  <option value="test_11" >test_11</option>
								  <option value="test_svr" >test_svr</option>
								  <option value="zz" >zz</option>
                              </select></td>
                          </tr>
                        </table></td>
                      <td width="700" align="center" valign="top"><table border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td height="4"></td>
                          </tr>
                          <tr>
                            <td height="2" bgcolor="#c9c9c9"></td>
                          </tr>
                          <tr>
                            <td height="4" align="center"></td>
                          </tr>
                          <tr>
                            <td width="700" align="center"><table border="0" cellspacing="0" cellpadding="0">
                                <colgroup>
                                <col width="340">
                                <col width="*">
                                <col width="340">
                                </colgroup>
                                <tr>
                                  <td><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td><img src="../../../images/dot_1.gif" width="24" height="28" /></td>
                                        <td><strong>등록시스템</strong></td>
                                      </tr>
                                    </table></td>
                                  <td align="center">&nbsp;</td>
                                  <td><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td><img src="../../../images/dot_1.gif" width="24" height="28" /></td>
                                        <td><strong>신청시스템</strong></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table>
                              <table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="30" align="center" class="PopupLine"><select multiple size="7" name="reg_system" style="width:340" onDblClick="move(document.form.reg_system,document.form.req_system)" class="InputGray">
                                    </select></td>
                                  <td align="center"><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td align="center"><img src="../../../images/btn_S1.gif" width="20" height="17" /></td>
                                      </tr>
                                      <tr>
                                        <td align="center">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td align="center"><img src="../../../images/btn_S2.gif" width="20" height="17" /></td>
                                      </tr>
                                    </table></td>
                                  <td height="30" align="center" class="PopupLine"><select multiple size="7" name="reg_system2" style="width:340" ondblclick="move(document.form.reg_system,document.form.req_system)" class="InputGray">
                                    </select></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="4" align="center"></td>
                          </tr>
                          <tr>
                            <td height="2" bgcolor="#c9c9c9"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td colspan="2"  class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                          <colgroup>
                          <col width="100">
                          <col width="*">
                          </colgroup>
                          <tr>
                            <td height="30" class="PopupBold">사용목적</td>
                            <td><input name="object" type="text" class="inputLIneGrayColor" size="50" maxlength="50"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td></td>
          <td height="40" align="right"><a href="#"><img style="margin-right:6px" src="../../../images/btn_regist.gif" width="42" height="22"></a><a href="#"><img src="../../../images/btn_close.gif" width="42" height="22"></a></td>
          <td></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
