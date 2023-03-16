package console.company.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.require.dao.RequireDao;
import console.common.util.CommonUtil;
import console.company.dao.CompanyDao;


public class CompanyCmd extends BaseCommand{
	public String str="testabc";
	
	public CompanyCmd() {
		setNextPage("/company/company_list.jsp?");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray checkoptiontray     = null;
		
		try {
			CompanyDao dao = new CompanyDao();
			rsTray=dao.List(getConnection(), reqTray);
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
