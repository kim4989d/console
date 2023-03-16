package console.service.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.require.dao.RequireDao;
import console.common.util.CommonUtil;
import console.service.dao.ServiceOperRegDao;

/*
 * ���񽺰��� cmd
 * �ۼ���    : �ֽ���
 * e-mail : halfodys@gmail.com 
 * date   : 2009-02-07
 */

public class ServiceOperRegCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ServiceOperRegCmd() {
		setNextPage("/service/service_oper_reg.jsp?");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray checkoptiontray     = null;
		
		try {
			ServiceOperRegDao dao = new ServiceOperRegDao();
			checkoptiontray=dao.WorkCheckBoxList(getConnection(), reqTray);
			checkbox=	CommonUtil.WorkSelectBox(checkoptiontray, reqTray);
			rsTray=dao.WorkedList(getConnection(), reqTray);
		} catch (AppException ex) {
				throw ex;
			}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);
			request.setAttribute("namecheckbox", checkbox);			
		}
	}
}
