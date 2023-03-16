package console.require.cmd;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.require.dao.RequireDao;
import console.common.util.CommonUtil;



public class RequireUserUpdateCmd extends BaseCommand{
		
	public RequireUserUpdateCmd() {
		setNextPage("/require.do?cmd=require_user_list");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		String message="";
		
		try {
			RequireDao dao = new RequireDao();
			
			 dao.userUpdate(getConnection(), reqTray);
			
			
			 message="1건의 승인이 완료되었습니다";
			
			
			} catch (AppException ex) {
				throw ex;
	
			}
	catch (Exception ex) {
		throw new AppException("에서 일반 예외 발생", ex);
	}
		finally{
		//	request.setAttribute("update", rsTray);
			request.setAttribute("message", message);
		}
	}
	
	
	
	
	
}
