package console.admin.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.util.CommonUtil;
import console.admin.dao.AdminDao;
public class AdminUserSystemListCmd extends BaseCommand
{
		public String str="testabc";
		public String checkbox="";
		
		public AdminUserSystemListCmd() {
			setNextPage("/admin/admin_user_system_list.jsp");
		}
		
		protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
			ResultSetTray rsTray     			= null;
			
			ResultSetTray checkoptiontray       = null;
			
			String uKind 		=	"";
			String cert_date	=	"";
			
			try {
				AdminDao dao = new AdminDao();
				
				checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);
				checkbox =	CommonUtil.AdminUserListBox(checkoptiontray,reqTray); 		// Select �� �ҷ��� (DBó�� )
		
				rsTray=dao.UserSystemList(getConnection(),reqTray); 			  		// ����� ������ �ý��� ��� �ҷ� ����  
			//	rsTray2=dao.JoinSysName2(getConnection(),reqTray); 				  		// ���� ���� ��� �ҷ� ����2 

			} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)", ex);
		}
			finally{
				request.setAttribute("rsTray" , rsTray);    		// ���� ���� ��� �ҷ� ����

				
				request.setAttribute("checkbox",checkbox); 			// check box ��� �ҷ� ����
				
			//	request.setAttribute("rsTray2", rsTray2);  			// ���� ���� ��� �ҷ� ����  
			}
		}
		
		
		
		
		
	}

