package console.admin.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.util.CommonUtil;
import console.admin.dao.AdminDao;
public class AdminUserListCmd extends BaseCommand
{
		public String str="testabc";
		public String checkbox="";
		
		public AdminUserListCmd() {
			setNextPage("/admin/admin_user_list.jsp");
		}
		
		protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
			ResultSetTray rsTray     = null;
			ResultSetTray rsTray2     = null;
			ResultSetTray checkoptiontray     = null;
			
			try {
				AdminDao dao = new AdminDao();
				
				checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);
//				checkbox =	CommonUtil.AdminUserListBox(checkoptiontray,reqTray); // Select �� �ҷ��� (DBó�� )
		
				rsTray=dao.AdminUserList(getConnection(),reqTray); 	//����� ��� �ҷ����� 
			//	rsTray2=dao.JoinSysName2(getConnection(),reqTray); 	// ���� ���� ��� �ҷ� ����2 
				
			} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)", ex);
		}
			finally{
				request.setAttribute("rsTray", rsTray);    // ���� ���� ��� �ҷ� ���� 
				request.setAttribute("checkbox",checkbox); // check box ��� �ҷ� ���� 
			//	request.setAttribute("rsTray2", rsTray2);  // ���� ���� ��� �ҷ� ����  
			}
		}
		
		
		
		
		
	}

