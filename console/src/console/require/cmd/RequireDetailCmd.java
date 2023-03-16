package console.require.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.require.dao.RequireDao;


/**
 * 
 *  ����:	������û ��Ȳ -> ���� ó���� �ʿ��� �������� �ۼ�
 *  ������: 	require\require_user_details.jsp
 * 	�ۼ���:	���漷 
 */

public class RequireDetailCmd extends BaseCommand{
		
	public RequireDetailCmd() {
		setNextPage("/require/require_user_details.jsp");	
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		
		ResultSetTray userList		  = null;			//�ű� ���� ��û�� ��ü ����
		ResultSetTray companyList     = null;			//��ü ȸ�� ����
		
		
		try {
			RequireDao dao = new RequireDao();			
			
			userList	= dao.userList(getConnection(), reqTray);		//TBL_USER�� �ű� ��û�� �ش� ���� 
			companyList = dao.companyList(getConnection(), reqTray);	//TBL_COMPANY �� ��ü ȸ�� ���� 
			
			
			
			
			
			
			} catch (AppException ex) {
				throw ex;
	
			}
	catch (Exception ex) {
		throw new AppException("RequireDatailCmd ������ DAO�� ����  �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("rsCompanyListTray", companyList);
			request.setAttribute("rsUserListTray", userList);
		}
	}
	
	
	
	
	
}
