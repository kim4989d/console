package console.require.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.require.dao.RequireAccountDao;



public class RequireAccountCmd extends BaseCommand{

	
	public RequireAccountCmd() {
		setNextPage("/require/pop/require_pop_list.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		
		ResultSetTray rsTray     = null;
		
		try {
			
			RequireAccountDao dao = new RequireAccountDao();

			rsTray=dao.TBL_CONN_CERT_KEY_USERList(getConnection(),reqTray);
			
			} catch (AppException ex) {
				throw ex;
	
			}
	catch (Exception ex) {
		throw new AppException("RequireUnixCmd / dao.unixList(getConnection(),reqTray);에서 일반 예외 발생", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);
		}
	}
	
	
	
	
	
}
