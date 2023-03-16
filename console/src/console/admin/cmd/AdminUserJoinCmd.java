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
//								�α��� â  
//=======================================================================
public class AdminUserJoinCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public AdminUserJoinCmd() {
		setNextPage("/admin/admin_user_join.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {

		ResultSetTray rsTray      = null;   // �Ҽӻ�  �ҷ� ���� 
		ResultSetTray rsTray2     = null;   // ������ �ҷ����� 1
		ResultSetTray rsTray3     = null;   // ������ �ҷ����� 2		
		
		
		try {
			AdminDao dao = new AdminDao();
			
			rsTray		=	dao.CompanyName(getConnection(),reqTray); 	   	   //   �Ҽӻ� �ҷ� ���� 
			rsTray2		=	dao.selectService1(getConnection(),reqTray);	   // 	������ �ҷ� ���� 1  
			rsTray3		=	dao.selectService2(getConnection(),reqTray);	   // 	������ �ҷ� ���� 2

		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("rsTray",  rsTray);    //  �Ҽӻ� �ҷ� ���� 
			request.setAttribute("rsTray2", rsTray2);  //  ������ �ҷ� ���� 1
			request.setAttribute("rsTray3", rsTray3);  //  ������ �ҷ� ���� 2
		}
	}
	
	
	
	
	
}
