package console.list.cmd;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import console.admin.dao.AdminDao;
import console.common.cmd.*;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.list.dao.BoardDao;

public class BoardCmd extends BaseCommand{

	public BoardCmd() {
		setNextPage("/list2.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		BoardDao   dao        = null;
		ResultSetTray rsTray     = null;
	
	
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		
		
		try {
//		dao = new BoardDao();
//		
//		if(cmd.equals("read")){
//		rsTray = dao.ReadDetail(getConnection(), reqTray);
//		setNextPage("/read2.jsp");
//		
//		}else if(cmd.equals("list")){
//	
//		rsTray = dao.BoardList(getConnection(), reqTray);
//		setNextPage("/list2.jsp");
//		
//		}else if(cmd.equals("new")){
//		//dao.insertBoard(getConnection(), reqTray);	
//		
//			setNextPage("/Post2.jsp");	
//		
//		}else if(cmd.equals("write")){
//	
//		
//			dao.insertBoard(getConnection(), reqTray);	
//		rsTray = dao.BoardList(getConnection(), reqTray);
//		setNextPage("/list2.jsp");		
//			
//			
//		}
		
		
			dao = new BoardDao();
			rsTray = dao.BoardList(getConnection(), reqTray);
		
//		for(int i=0;i<rsTray.getRowCount();i++){
//			
//			System.out.println("num ->"+rsTray.get("num",i));
//			
//		}
		
	
	} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
	}
	finally{
		request.setAttribute("rsTray", rsTray);
			
	}
	
	}
	
	
	
	
	
}
