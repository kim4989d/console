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
				checkbox =	CommonUtil.AdminUserListBox(checkoptiontray,reqTray); 		// Select 를 불러움 (DB처리 )
		
				rsTray=dao.UserSystemList(getConnection(),reqTray); 			  		// 사용자 관리쪽 시스템 목록 불러 오기  
			//	rsTray2=dao.JoinSysName2(getConnection(),reqTray); 				  		// 서비스 선택 목록 불러 오기2 

			} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)", ex);
		}
			finally{
				request.setAttribute("rsTray" , rsTray);    		// 서비스 선택 목록 불러 오기

				
				request.setAttribute("checkbox",checkbox); 			// check box 목록 불러 오기
				
			//	request.setAttribute("rsTray2", rsTray2);  			// 서비스 선택 목록 불러 오기  
			}
		}
		
		
		
		
		
	}

