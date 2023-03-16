package console.admin_backup.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import console.admin_backup.dao.QaCommonDao;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;


public class QaInputCmd extends BaseCommand {
	
	public QaInputCmd() {
		setNextPage("qa_A_input.jsp");
	}

	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		QaCommonDao   dao        = null;
		ResultSetTray rsTray     = null;
		
		try {
			dao = new QaCommonDao();
			rsTray = dao.findQiEtc(getConnection(), reqTray);
			request.setAttribute("qi_etc", rsTray);
		} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
		}
	}
}