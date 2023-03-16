package console.require.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.require.dao.RequireTestDao;



public class RequireTestCmd extends BaseCommand{
	
	public RequireTestCmd() {
		setNextPage("/require/test.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		
		ResultSetTray rsTray     = null;
		
		try {
			
			String test = reqTray.get("test");
			String test1 = reqTray.get("test1");
			
			test = "�ٺ�";
			test1 = "õ��";
			
			reqTray.set("test", test);
			reqTray.set("test1", test1);
			
			RequireTestDao dao = new RequireTestDao();
			
			rsTray =  dao.test(getConnection(), reqTray);
			
			
			} catch (AppException ex) {
				throw ex;
	
			}
	catch (Exception ex) {
		throw new AppException("RequireUnixCmd / dao.unixList(getConnection(),reqTray);���� �Ϲ� ���� �߻�", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);
		}
	}
	
	
	
	
	
}
