package console.category.cmd;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import console.admin_backup.dao.QaCommonDao;
import console.common.cmd.*;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.category.dao.*;

public class categorycmd extends BaseCommand{

	public categorycmd() {
		setNextPage("/vaatz/src/vsim/CInet/hmc/kr/Basic/Basic.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		categorydao   dao        = null;
		ResultSetTray rsTray     = null;
	try {
		dao = new categorydao();
		
		rsTray = dao.categoryList(getConnection(), reqTray);
		
		//rsTray2=dao.ReList(getConnection(),reqTray);
		System.out.println("doexe end");

		System.out.println("rsTray.size()->"+rsTray.getRowCount());
		
		String str="<table  width=\"180\" border=\"0\" align=\"center\" bgcolor=\"#2365C3\" cellpadding=\"1\" cellspacing=\"1\">";
		
		
		
		
		
		for(int i=0;i<rsTray.getRowCount();i++){
			System.out.println("rsTray : "+rsTray.get("one",i)+","+rsTray.get("two",i));
			if(!rsTray.get("one",i).equals("") && !rsTray.get("level_two",i).equals("")){
			str+="<tr><td bgcolor=\"#FFB400\" align=\"center\" onclick=\"show_menu(document.all.menu"+i+");\" style=\"cursor:hand;\"><font color=\"white\"><b>"+rsTray.get("one",i)+"</b></font></td> \n";
			
			str+="</tr><tr id=\"menu"+i+"\" style=\"display:none\"><td bgcolor=\"white\"> \n";
			}
			
			if(!rsTray.get("level_one",i).equals("") & !rsTray.get("level_two",i).equals("")){
			str+="<table  width=\"180\" border=\"0\" align=\"center\" bgcolor=\"#FFB400\" cellpadding=\"3\" cellspacing=\"1\">\n";
			//str+="<tr><td bgcolor=\"white\">"+rsTray.get("two",i)+"</tr></table>\n";
			
			//str+="<tr><td bgcolor=\"white\">"+rsTray.get("two",i)+"</tr></table>\n";
			str+="<tr><td bgcolor=\"white\"><a href='";
		    str+=rsTray.get("two",i)+"'  onMouseover=\"showtip2(this,event,'"+rsTray.get("two",i)+"')\" onMouseout=\"hidetip2()\">"+rsTray.get("two",i)+"</a><br>"; 
				str+="   </tr></table>\n";
			
			
			
			}
			
		}
		
	
		str+="</td></tr>";
		str+="</table>";
		
		//buffer.append("function display(){");
	request.setAttribute("buff", str);
	} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
	}
	finally{
		
			
	}
	
	}
	
	
	
	
	
}
