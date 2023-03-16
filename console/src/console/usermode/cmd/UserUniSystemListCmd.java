package console.usermode.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.require.dao.RequireDao;
import console.common.util.CommonUtil;
import console.usermode.dao.UserUniSystemListDao;


public class UserUniSystemListCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
//	public String checkbox2="";
	
	public UserUniSystemListCmd() {
		setNextPage("/usermode/user_uni_systemList.jsp?");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray checkoptiontray     = null;
		
		try {
			UserUniSystemListDao dao = new UserUniSystemListDao();
	
			checkoptiontray=dao.WorkCheckBoxList(getConnection(), reqTray);
			System.out.println("################ "+checkoptiontray.getRowCount());
			
			checkbox=	CommonUtil.WorkSelectBox(checkoptiontray, reqTray);
			//checkbox2=	CommonUtil.WorkSelectBox2(checkoptiontray, reqTray);
			
			rsTray=dao.WorkedList(getConnection(), reqTray);
		} catch (AppException ex) {
				throw ex;
			}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);
			request.setAttribute("namecheckbox", checkbox);
			//request.setAttribute("namecheckbox2", checkbox2);				
		}
	}
}
