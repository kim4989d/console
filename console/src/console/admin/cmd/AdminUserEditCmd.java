package console.admin.cmd;
//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��     : ȸ������ 
//Ư��  ����   :  
//======================================================================



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.util.CommonUtil;
import console.admin.dao.AdminDao;

//=======================================================================
//							 ����� ���� ���� �κ� 
//=======================================================================
public class AdminUserEditCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public AdminUserEditCmd() {
		setNextPage("/admin/admin_user_edit.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {

		ResultSetTray rsTray     			= null;   // �Ҽӻ�  �ҷ� ���� 
		ResultSetTray rsTray2     			= null;   // ������ �ҷ����� 1
		ResultSetTray rsTray3     			= null;   // ������ �ҷ����� 2
		ResultSetTray UserEditList			= null;	  // ���� ��� �ҷ����� 
		ResultSetTray UserServiceId			= null;	  // ���� ID �ҷ�����
		ResultSetTray UserSystemList2		= null;	  // ���� �ý��� ��� 
		ResultSetTray UserSmsWork			= null;	  // SMS
		
		
		String uKind 		=	"";
		String cert_date	=	"";
		String uid		=	"";
		
		try {
			AdminDao dao = new AdminDao();
			
			rsTray		=	dao.CompanyName(getConnection(),reqTray); 	   	   			//  �Ҽӻ� �ҷ� ���� 
			rsTray2		=	dao.selectService1(getConnection(),reqTray);	   			// 	������ �ҷ� ���� 1  
			rsTray3		=	dao.selectService2(getConnection(),reqTray);	   			// 	������ �ҷ� ���� 2
			
			UserEditList 		= dao.UserEditList(getConnection(), reqTray);			//  ���� ��� �ҷ� ����
			
			
			uid		=	 UserEditList.get("user_id");	
			uKind 		=	 UserEditList.get("kind");
			cert_date	=    UserEditList.get("cert_date");
			
			if (uKind.equals("O") || uKind.equals("A")){
			
			UserServiceId   	= dao.UserServiceId(getConnection(), reqTray, uid);			//  ���� id
			
			
			}else if(!uKind.equals("O")){
				UserSystemList2		= dao.UserSystemList2(getConnection(), reqTray , uid );	//  �ý��� ����Ʈ 
			}

			if ((uKind.equals("G") || uKind.equals("M")) && cert_date.equals("")){
				UserSmsWork			= dao.UserSmsWork(getConnection(), reqTray,uid);		//  SMS 

			}
			

		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("rsTray",  rsTray);    		//  �Ҽӻ� �ҷ� ���� 
			request.setAttribute("rsTray2", rsTray2);  			//  ������ �ҷ� ���� 1
			request.setAttribute("rsTray3", rsTray3);  			//  ������ �ҷ� ���� 2
			request.setAttribute("rsTray4", UserEditList);    	//  ���� ��� �ҷ� ���� 
			request.setAttribute("rsTray5", UserServiceId);    	//  ���� id
			request.setAttribute("rsTray6", UserSystemList2);   //  �ý��� ����Ʈ 
			request.setAttribute("rsTray7", UserSmsWork);   	//  SMS
		}
	}
	
	
	
	
	
}
