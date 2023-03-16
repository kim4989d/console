package console.qadb.cmd;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.qadb.dao.QaDetailDao;

public class QaDetailCmd extends BaseCommand {
	
	public QaDetailCmd() {
		setNextPage("qa_detail.jsp");
	}

	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		QaDetailDao   dao        = null;
		ResultSetTray rsTray     = null;
		try {
			dao = new QaDetailDao();
			//qna 토탈갯수 
			rsTray=dao.getHistoryLine(getConnection(), reqTray);
		} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
		}
		finally{
			request.setAttribute("HistoryLine",rsTray);
				
		}
	
	
	}
}