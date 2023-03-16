package console.work.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.require.dao.RequireDao;
import console.common.util.CommonUtil;
import console.work.dao.WorkDao;



public class WorkCmd extends BaseCommand{
	public String calender="";
	public String checkbox="";
	public String checkbox2="";
	
	public WorkCmd() {
		setNextPage("/work/work_list.jsp?");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray checkoptiontray     = null;
	
		
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		
		try {
			WorkDao dao = new WorkDao();
			//임시 미사용. 
			checkoptiontray=dao.WorkCheckBoxList(getConnection(), reqTray);
//			checkbox=	CommonUtil.WorkSelectBox(checkoptiontray, reqTray);
			checkbox2=	CommonUtil.WorkSelectBox2(checkoptiontray, reqTray);
			calender=CommonUtil.CalTextBoxFrom(reqTray);
			rsTray=dao.WorkList(getConnection(), reqTray);
			
			
			
		
		
		} catch (AppException ex) {
				throw ex;
	
			}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);
			request.setAttribute("namecheckbox", checkbox);
			request.setAttribute("namecheckbox2", checkbox2);
			request.setAttribute("calenderbox", calender);
						
		
		}
	}
	
	
	
	
	
}
