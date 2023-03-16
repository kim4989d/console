package console.require.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.require.dao.RequireDao;



public class RequireNtCmd extends BaseCommand{

	
	public RequireNtCmd() {
		setNextPage("/require/unix/require_unix_list.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		
		ResultSetTray rsTray     = null;
		
		try {
			
			RequireDao dao = new RequireDao();

//			rsTray=dao.unixList(getConnection(),reqTray);
//			rsTray=dao.ntList(getConnection(),reqTray);
			
			
			} catch (AppException ex) {
				throw ex;
	
			}
	catch (Exception ex) {
		throw new AppException("RequireNtCmd / dao.unixList(getConnection(),reqTray);에서 일반 예외 발생", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);
		}
	}
	
	
	
	
	
}
