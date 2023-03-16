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
//				checkbox =	CommonUtil.AdminUserListBox(checkoptiontray,reqTray); // Select 를 불러움 (DB처리 )
		
				rsTray=dao.AdminUserList(getConnection(),reqTray); 	//사용자 목록 불러오기 
			//	rsTray2=dao.JoinSysName2(getConnection(),reqTray); 	// 서비스 선택 목록 불러 오기2 
				
			} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)", ex);
		}
			finally{
				request.setAttribute("rsTray", rsTray);    // 서비스 선택 목록 불러 오기 
				request.setAttribute("checkbox",checkbox); // check box 목록 불러 오기 
			//	request.setAttribute("rsTray2", rsTray2);  // 서비스 선택 목록 불러 오기  
			}
		}
		
		
		
		
		
	}

