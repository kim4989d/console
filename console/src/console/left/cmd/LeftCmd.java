package console.left.cmd;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.login.dao.LoginDao;
import console.common.util.CommonUtil;
import console.left.dao.LeftDao;



public class LeftCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public LeftCmd() {
		setNextPage("/main/index.jsp");
	}
	
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray    		  = null;
		ResultSetTray checkoptiontray     = null;
	
		
		//String cmd=reqTray.get("cmd");
		//String write="";
		
		try {
			LeftDao dao = new LeftDao();
		//checkbox list option 	
		//checkoptiontray=dao.CheckBoxList(getConnection(),reqTray);
		// checkbox=	CommonUtil.SelectBox(checkoptiontray,reqTray);

			


//			��û��Ȳ -> ����Ű �̻�� ��Ȳ LIST

//			flagValues
//			div = left menu values
			//
//			request values
//			kind	= ���� 
//			user_id	= ����

			dao.KeyNotList(getConnection(),reqTray);	


//			��û��Ȳ -> �ý��� ����û ��Ȳ List

//			flagValue
//			div	= left request vlaue
			//
//			request values
//			kind	= ����

//			dao.SystemUseList(getConnection(),reqTray);


//			��û��Ȳ -> 	���� ��û��Ȳ List


//			flagValues
//			div = left Menue value
			//
//			request vlaues
//			user_id	= ����
//			kind	= ����


//			dao.UserInputList(getConnection(),reqTray);



//			��û��Ȳ -> NT �۾���û��Ȳ

//			flag values
//			div 	= left�޴����� �Ѿ� ���� ��
			//
//			request values
//			kind	= ����
//			user_id = ����


//			dao.NtWorkList(getConnection(),reqTray);

//			��û��Ȳ -> Unix �۾���û��Ȳ LIST
//			user_id	= ���� 
//			kind 	= ���� 

//			dao.UnixWorkList(getConnection(),reqTray);	

			
			
			
//			======================================================================================
//			����� ���� ��� �ҷ����� 
//		=====================================================================================

//			dao.UserManagementList(getConnection(),reqTray);	
			
//			=======================================================================================
//			����� ���� (�ý��� ��� �ҷ� �ֱ� )
//		=======================================================================================
//			dao.UserManagementSystemList(getConnection(),reqTray);			
		
			
//			/=========================================================================================
//			��� ��� �ҷ� ����  (���� ��� ��� ��Ȳ_��� ����  )
//		=========================================================================================
			
			
//			dao.UserUseServerConnList(getConnection(),reqTray);
			
			

//			===========================================================================                           
//			��� ��� �ҷ� ����  (���� ��� ��� ��Ȳ_����  )             
//		===========================================================================                           
			
//			dao.UserUseServeDeleterList(getConnection(),reqTray);
			
			
			getConnection().close();		
			
			
			
			
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("LoginCheck", rsTray);
			request.setAttribute("checkbox",checkbox);
				
		
		}
	}
	
	
	
	
	
}
