package console.admin.cmd;
//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��    : ȸ������(���̵� �ߺ� Ȯ��) 
//Ư��  ����  :  
//��	 ��  ��   : �� �� �� 
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
public class AdminUseridReapeatCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public AdminUseridReapeatCmd() {
		setNextPage("/admin/admin_user_id_repeat.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;   //���̵� �ߺ� Ȯ�� ������
		
		ResultSetTray checkoptiontray     = null;
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		String kind = reqTray.get("uKind");
		if(kind.equals("") || kind == null){
			kind = "G";}
		String uid = reqTray.getString("uid");
		
		try {
			AdminDao dao = new AdminDao();
			
			//checkoptiontray=dao.CheckBoxList(getConnection(),reqTray);
			//checkbox=	CommonUtil.SelectBox(checkoptiontray,reqTray);

			rsTray		=	dao.IdRepeat(getConnection(),reqTray);  	   //	���̵� �ߺ� Ȯ�� ������
			
			System.out.println(rsTray);						   // 	���̵� �ߺ� Ȯ�� �ϱ� 
		
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);    // ���̵� �ߺ� Ȯ�� ������ 
			request.setAttribute("uid", uid);
			//request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
