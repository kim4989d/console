package console.service.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.require.dao.RequireDao;
import console.common.util.CommonUtil;
import console.service.dao.PopUpdateDao;

/*
 * ���� ���� ����  cmd
 * �ۼ���    : �ֽ���
 * e-mail : halfodys@gmail.com 
 * date   : 2009-02-07
 */

public class PopUpdateCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public PopUpdateCmd() {
		setNextPage("/service/service_popup.jsp?");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray checkoptiontray     = null;
		
		try {
			PopUpdateDao dao = new PopUpdateDao();
//			checkoptiontray=dao.Adminer(getConnection(), reqTray);
//checkbox=	CommonUtil.AdminSelectBox(checkoptiontray, reqTray);
			rsTray=dao.ServiceList(getConnection(), reqTray);
//			dao.ServiceUpdate(conn, reqTray);			
		} catch (AppException ex) {
				throw ex;
			}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);
			request.setAttribute("AdminSelectBox", checkoptiontray);			
		}
	}
}
