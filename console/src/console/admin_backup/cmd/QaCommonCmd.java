package console.admin_backup.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import console.admin_backup.dao.QaCommonDao;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;


public class QaCommonCmd extends BaseCommand {
	
	
	
	
	public QaCommonCmd() {
		setNextPage("qa_empty.jsp");
	}

	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		String proc = null;
		
		proc = reqTray.getString("proc");
		if (proc.equals("qi_class")) {
			doQAClass(reqTray, request, response);
			setNextPage("common/qa_qi_class.jsp");
			
		} else if (proc.equals("goods_info")) {
			doGoodsInfo(reqTray, request, response);
			setNextPage("common/qa_goods_inof.jsp");
			
		} else if (proc.equals("class")) {
			doClass(reqTray, request, response);
			setNextPage("common/qa_class.jsp");
			
		} else if (proc.equals("goods_list")) {
			doGoodsList(reqTray, request, response);
			setNextPage("common/qa_goods_list.jsp");
		}
	}

	private void doGoodsList(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		QaCommonDao   dao        = null;
		ResultSetTray rsTray     = null;
		
		try {
			if ( reqTray.getString("qi_goods_name").length() > 0 ) {
				dao = new QaCommonDao();
				rsTray = dao.findGoodsList(getConnection(), reqTray);
			} else {
				rsTray = new ResultSetTray();
			}
			request.setAttribute("goods_list", rsTray);
		} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
		}
	}

	private void doClass(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		QaCommonDao   dao        = null;
		ResultSetTray rsTray     = null;
		
		try {
			dao = new QaCommonDao();
			rsTray = dao.findClass1(getConnection(), reqTray);
			request.setAttribute("class_1", rsTray);

			if(reqTray.getString("class_1").length() > 0){
				rsTray = dao.findClass2(getConnection(), reqTray);
				request.setAttribute("class_2", rsTray);
				
				if(reqTray.getString("class_2").length() > 0){
					rsTray = dao.findClass3(getConnection(), reqTray);
					request.setAttribute("class_3", rsTray);
					
					if(reqTray.getString("class_3").length() > 0){
						rsTray = dao.findClass4(getConnection(), reqTray);
						request.setAttribute("class_4", rsTray);
					}
				}
			}
		} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
		}
	}

	private void doGoodsInfo(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		QaCommonDao   dao        = null;
		ResultSetTray rsTray     = null;
		
		try {
			dao = new QaCommonDao();
			rsTray = dao.findGoodsInfo(getConnection(), reqTray);
			request.setAttribute("goods_info", rsTray);
		} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
		}
	}
	
	private void doQAClass(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		QaCommonDao   dao        = null;
		ResultSetTray rsTray     = null;
		
		try {
			dao = new QaCommonDao();
			rsTray = dao.findQaClass1(getConnection(), reqTray);
			request.setAttribute("qi_class_1", rsTray);

			if(reqTray.getString("qi_class_1").length() > 0){
				rsTray = dao.findQaClass2(getConnection(), reqTray);
				request.setAttribute("qi_class_2", rsTray);
				if(reqTray.getString("qi_class_2").length() > 0){
					rsTray = dao.findQaClass3(getConnection(), reqTray);
					request.setAttribute("qi_class_3", rsTray);
				}
			}
		} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
		}
	}
}
