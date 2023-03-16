package console.qadb.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.qadb.dao.QaGoodsDao;


public class QaGoodsCmd extends BaseCommand {
	
	public QaGoodsCmd() {
		setNextPage("qa_goods.jsp");
	}

	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
	
		QaGoodsDao   dao        = null;
		String order=reqTray.get("order");	
		String page=reqTray.get("page");
		String paging=reqTray.get("paging");
		System.out.println("doExecute paging:"+paging);
		String next=reqTray.get("next");
		String prev=reqTray.get("prev");
		int totalnum=0;
		String returnpage="";
		ResultSetTray HistoryTray     = null;
		ResultSetTray RegulationTray     = null;
		ResultSetTray KnowledageTray     = null;
			
			try {
			dao = new QaGoodsDao();
		
			
		
			HistoryTray = dao.HistoryList(getConnection(), reqTray);
			RegulationTray=dao.RegulationList(getConnection(),reqTray);
			KnowledageTray = dao.KnowledageList(getConnection(), reqTray);
			
			
			} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
		}
		finally{
			request.setAttribute("HistoryList",HistoryTray);
			request.setAttribute("RegulationList",KnowledageTray);
			request.setAttribute("KnowledageList",KnowledageTray);
			request.setAttribute("order",order);
			request.setAttribute("page",page);
			request.setAttribute("returnpage",returnpage);
				
		}
	
	}
}