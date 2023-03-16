package console.qadb.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.qadb.dao.QaHistoryDao;
import console.qadb.dao.QaMainDao;


public class QaMainCmd extends BaseCommand {
	
	public QaMainCmd() {
		setNextPage("qa_main.jsp");
	}

	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		QaMainDao   dao        = null;
		String order=reqTray.get("order");	
		String page=reqTray.get("page");
		String paging=reqTray.get("paging");
		System.out.println("doExecute paging:"+paging);
		String next=reqTray.get("next");
		String prev=reqTray.get("prev");
		int totalnum=0;
		String returnpage="";
		ResultSetTray HistoryTray     = null;
		ResultSetTray KnowledageTray     = null;
			
			try {
			dao = new QaMainDao();
		
			
			//qna ��Ż���� 
			//totalnum=dao.getTotalNum(getConnection(), reqTray);
			//System.out.println("main ��Ż����:"+totalnum);
			//���� ������ ��� 
			//returnpage=dao.getPaging(totalnum,page,paging);
			//System.out.println("���� ������ ���:"+returnpage);
			
			//����Ʈ ���̺���ȸ 
		
			HistoryTray = dao.HistoryList(getConnection(), reqTray);
			KnowledageTray = dao.KnowledageList(getConnection(), reqTray);
			
			
			} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
		}
		finally{
			request.setAttribute("HistoryList",HistoryTray);
			request.setAttribute("KnowledageList",KnowledageTray);
			request.setAttribute("order",order);
			request.setAttribute("page",page);
			request.setAttribute("returnpage",returnpage);
				
		}
	
	
	
	
	}
}