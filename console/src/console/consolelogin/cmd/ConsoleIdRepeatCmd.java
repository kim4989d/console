//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��    : ȸ������(���̵� �ߺ� Ȯ��) 
//Ư��  ����  :  
//��	 ��  ��   : �� �� �� 
//��         ¥  : 2009-02-06
//======================================================================
package console.consolelogin.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.util.CommonUtil;
import console.consolelogin.dao.ConsoleJoinDao;

//=======================================================================
//										�α��� â  
//=======================================================================
public class ConsoleIdRepeatCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ConsoleIdRepeatCmd() {
		setNextPage("/consolelogin/console_id_repeat.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray IdRepeat     = null;  
		
		ResultSetTray checkoptiontray     = null;
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		String kind = reqTray.get("uKind");
		if(kind == "" || kind == null){
			kind = "G";}
		String uid = reqTray.getString("uid");
		
		try {
			ConsoleJoinDao dao = new ConsoleJoinDao();
			
			//checkoptiontray=dao.CheckBoxList(getConnection(),reqTray);
			//checkbox=	CommonUtil.SelectBox(checkoptiontray,reqTray);

			IdRepeat=dao.IdRepeat(getConnection(),reqTray);  	    //	���̵� �ߺ� Ȯ�� �ϱ� 
			
			System.out.println(IdRepeat);						    
		
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
		}
		finally{
			request.setAttribute("rsTray", IdRepeat);    
			request.setAttribute("uid", uid);			 
			//request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
