<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<!-- �˾�������  1000 * 516-->
<title>�˾�_NGS ����ڰ���_����ڵ��</title>
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
    <td height="46" background="../../../images/pop_1000bg_01.jpg" class="PopupTitleBgWhite"><img src="../../../images/pop_img01.gif" width="8" height="17" align="absmiddle" style="margin-left:10px; margin-right:10px">NGS ����� ���</td>
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
                      <td class="OrangeText"><strong>����� ����</strong></td>
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
                            <td height="30" class="PopupBold">����� ID </td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="uid" type="text" class="inputLIneGrayColor" size="23" maxlength="13" /></td>
                                  <td>&nbsp;<a href="#"><img src="../../../images/btn_id_check.gif" align="absmiddle"></a></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold" >��ȣ</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="pwd1" type="password" class="inputLIneGrayColor" size="23" maxlength="10"></td>
                                  <td>&nbsp;<span class="style1">���� ���� ���� 8�ڸ��� �Է� ���ּ���</span></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">��ȣȮ��</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="pwd2" type="password" class="inputLIneGrayColor" size="23" maxlength="10" /></td>
                                  <td>&nbsp;<span class="style1">���� �Է��Ͻ� ��ȣ�� �����ϰ� �Է��ϼ���. </span></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">����� ����</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="uKind" class="InputLIneSelect" onChange="uKindChange();change_menu(this.form.uKind.value)">
                                      <option value ="">����</option>
                                      <option value ="O">�����</option>
                                      <option value ="G" selected="selected">�Ϲݻ����</option>
                                      <option value ="M">���������۾���</option>
                                    </select></td>
                                  <td></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">��û����</td>
                            <td  class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="object" type="text" class="inputLIneGrayColor" size="50" maxlength="50">
                                    <img src="../../../images/dot_2.gif" align="absmiddle"><FONT COLOR="ff3116">�ʼ�</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="BlueText"><strong>�Ҽӻ�</strong></td>
                            <td><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="company" class="InputLIneSelect">
                                      <option value ="">����</option>
                                      <option value="ABLECOM">���̺���</option>
                                      <option value="ADS">�ռ�����Ÿ�ý���</option>
                                      <option value="AHNLAB">��ö��������</option>
                                      <option value="AIRCROSS">����ũ�ν�</option>
                                      <option value="ATSolution">ATSolution</option>
                                      <option value="BLUEDIGM">������</option>
                                      <option value="BNSWORKS">BNSWORKS</option>
                                      <option value="BTBSoluti">BTB�ַ��</option>
                                      <option value="CASSIS">CASSIS</option>
                                      <option value="CITYGAME">��Ƽ����</option>
                                      <option value="CP">Ŀ�ӽ��÷���</option>
                                      <option value="DONGDEUK">�����������</option>
                                      <option value="EASYMON">������</option>
                                      <option value="EFOTEK">������</option>
                                      <option value="EMC">EMC</option>
                                      <option value="ENCOREPLUS">���ھ��÷���</option>
                                      <option value="FORCS">���ÿ���</option>
                                      <option value="GTPLUS">GT�÷���</option>
                                      <option value="HAEORUM">�ؿ���</option>
                                      <option value="HP">HP</option>
                                      <option value="IBM">IBM</option>
                                      <option value="ICENT">���̼�Ʈ</option>
                                      <option value="ICONLAB">�����ܷ�</option>
                                      <option value="IGLOOSEC">�̱۷��ť��Ƽ</option>
                                      <option value="IMC">IMC</option>
                                      <option value="INFOSEC">������</option>
                                      <option value="INNOTECH">�̳���ũ</option>
                                      <option value="INSOFT">���̿�����Ʈ</option>
                                      <option value="INZEN">����</option>
                                      <option value="ITPlus">ITPlus</option>
                                      <option value="IWT">���̴�����Ƽ</option>
                                      <option value="JAEUNGTECH">�����ũ</option>
                                      <option value="KEY2NET">KEY2NET</option>
                                      <option value="KOREANET">�ڸ��Ƴ�Ʈ</option>
                                      <option value="KORNIC">�ڴб۷θ�</option>
                                      <option value="LINUXONE">��������</option>
                                      <option value="MANTECH">����</option>
                                      <option value="MCURIX">��ť����</option>
                                      <option value="Microsoft">Microsoft�μ�����</option>
                                      <option value="NCODING">���ڵ��н�</option>
                                      <option value="NEXTCODE">�ؽ�Ʈ�ڵ�</option>
                                      <option value="NEXTGATE">�ؽ�����Ʈ</option>
                                      <option value="NKIA">��Ű��</option>
                                      <option value="NOKIA">��Ű��</option>
                                      <option value="PIXBYTE">�Ƚ�����Ʈ</option>
                                      <option value="PSYNET">���̳�</option>
                                      <option value="QCOM">ť��</option>
                                      <option value="RATHONTECH">������ũ</option>
                                      <option value="ROCKPLACE">���÷��̽�</option>
                                      <option value="RSUPPORT">�˽���Ʈ</option>
                                      <option value="SIGMAINFO">�ñ׸��������</option>
                                      <option value="SKCC">SK C&amp;C</option>
                                      <option value="SKTelecom">SKTelecom</option>
                                      <option value="SVL">SVL</option>
                                      <option value="TGCORP">Ƽ������</option>
                                      <option value="UCLICK">��Ŭ��</option>
                                      <option value="XEST">����Ʈ�������</option>
                                      <option value="ZESPRO">��������</option>
                                      <option value="cipher_cas">������ĳ����</option>
                                      <option value="solvix">�ֺ�</option>
                                      <option value="varobision">�ٷκ���</option>
                                    </select></td>
                                  <td><img src="../../../images/dot_2.gif" align="absmiddle" /><FONT COLOR="ff3116">�ʼ�</FONT></td>
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
                          <td height="30" class="PopupBold">�޴���</td>
                          <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><select name="hp4" size="1" class="InputLIneSelect">
                                    <option value ="">�����ϼ���</option>
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
                                  <span class="style1">��ȣ�̵��� ��� üũ</span><img src="../../../images/dot_2.gif" align="absmiddle"><font color="ff3116">�ʼ�</font></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="30" class="PopupBold">ȸ����ȭ</td>
                          <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><select name="tel4" class="InputLIneSelect">
                                    <option value=''>�����ϼ���</option>
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
                          <td height="30" class="PopupBold">�ѽ�</td>
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
                          <td height="30" class="PopupBold">�̸�</td>
                          <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><input name="uname2" type="text" class="inputLIneGrayColor" size="23" maxlength="20" style = "ime-mode:inable" /></td>
                                <td class="T11PopupText"><img src="../../../images/dot_2.gif" align="absmiddle" /><font color="ff3116">�ʼ�</font></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="30" class="PopupBold">�����</td>
                          <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><select name="oper2" class="InputLIneSelect" style="width:110" onChange="change_service(this.form.oper.value,this.form.company.value)">
                                    <option value=''>�������������</option>
                                  </select>                                </td>
                                <td class="T11PopupText"><img src="../../../images/dot_2.gif" align="absmiddle" /><font color="ff3116">�ʼ�</font> <span class="style1">(�Ŵ����� �����ϼ���.)</span> </td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="30" class="BlueText"><strong>���Ӻ� ����</strong></td>
                          <td class="BlueText"><table width="405" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="100"><input type="radio" name="sType" value="C" checked id="str1">
                                  ���Ӻ�����</td>
                                <td width="250"><input type="radio" name="sType" value="P" id="str2">
                                  �Ⱓ������</td>
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
                      <td height="30" class="OrangeText"><strong>����û ��Ȳ</strong></td>
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
                            <td class="BlueText"><strong>���� ����</strong></td>
                            <td><select name="company2" class="InputLIneSelect">
                                <option value ="">���񽺸� �����ϼ���</option>
							    <option selected>���񽺸� �����ϼ��� </option>
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
                                        <td><strong>��Ͻý���</strong></td>
                                      </tr>
                                    </table></td>
                                  <td align="center">&nbsp;</td>
                                  <td><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td><img src="../../../images/dot_1.gif" width="24" height="28" /></td>
                                        <td><strong>��û�ý���</strong></td>
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
                            <td height="30" class="PopupBold">������</td>
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
