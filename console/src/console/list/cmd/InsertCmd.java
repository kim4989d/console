package console.list.cmd;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.list.dao.InsertDao;

public class InsertCmd extends BaseCommand {
	
	public InsertCmd() {
		setNextPage("/list.do?cmd=list");
	}

	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		InsertDao   dao        = null;
		ResultSetTray rsTray     = null;
		try {
			
			dao = new InsertDao();
			dao.insertBoard(getConnection(), reqTray);//qna 토탈갯수 
			//rsTray = dao.BoardList(getConnection(), reqTray);
		} catch (AppException ex) {
			
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
		}
		finally{
			//request.setAttribute("rsTray", rsTray);
				
		}
	
	
	}
}