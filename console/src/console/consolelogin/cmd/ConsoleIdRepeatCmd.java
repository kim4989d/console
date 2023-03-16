//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능    : 회원가입(아이디 중복 확인) 
//특이  사항  :  
//작	 성  자   : 김 명 진 
//날         짜  : 2009-02-06
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
//										로그인 창  
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

			IdRepeat=dao.IdRepeat(getConnection(),reqTray);  	    //	아이디 중복 확인 하기 
			
			System.out.println(IdRepeat);						    
		
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
		}
		finally{
			request.setAttribute("rsTray", IdRepeat);    
			request.setAttribute("uid", uid);			 
			//request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
