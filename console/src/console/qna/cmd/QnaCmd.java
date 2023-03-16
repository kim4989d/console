package console.qna.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import console.admin.dao.QaCommonDao;
import console.common.cmd.*;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.qna.dao.QnaDao;


public class QnaCmd extends BaseCommand {

	
	
	public QnaCmd(){
		setNextPage("qa_qna.jsp");	
		
	}
	public  void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response)
	{
		QnaDao   dao        = null;
		ResultSetTray rsTray     = null;
		ResultSetTray rsTray2     = null;
		
		String order=reqTray.get("order");	
		String page=reqTray.get("page");
		String paging=reqTray.get("paging");
		System.out.println("doExecute paging:"+paging);
		String next=reqTray.get("next");
		String prev=reqTray.get("prev");
		int totalnum=0;
		String returnpage="";
		try {
			dao = new QnaDao();
			//qna 토탈갯수 
			totalnum=dao.getTotalNum(getConnection(), reqTray);
			System.out.println("qna 토탈갯수:"+totalnum);
			//현재 페이지 목록 
			returnpage=dao.getPaging(totalnum,page,paging);
			System.out.println("현재 페이지 목록:"+returnpage);
			
			//리스트 테이블조회 
			rsTray = dao.QnaList(getConnection(), reqTray);
			rsTray2=dao.ReList(getConnection(),reqTray);
		

			for(int i=0;i<rsTray2.size("");i++){
				System.out.println("qna_level: "+rsTray.getString("qna_level",i)+"\t");	
			//	System.out.println("count: "+count++);
				
			}
		} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
		}
		finally{
			request.setAttribute("QaHistoryList",rsTray);
			request.setAttribute("order",order);
			request.setAttribute("page",page);
			//request.setAttribute("paging",paging);
			request.setAttribute("returnpage",returnpage);
				
		}
	}


	
	


}
