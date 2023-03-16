package console.user.regist.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.require.dao.RequireDao;
import console.user.regist.dao.JobRegUnixDao;

import console.common.util.Util;


public class UnixJobCmd extends BaseCommand{
		
	public UnixJobCmd() {
		setNextPage("/user_unix/user_unix.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		
		try {
			String admin_result = "error";
			String status_result = "error";

			JobRegUnixDao dao = new JobRegUnixDao();
			

			//List Query Call
			rsTray = dao.unixJobdList(getConnection(),reqTray);
			
			
			for(int i = 0; i < rsTray.getRowCount(); i++){
				/*
				 * ���н��� ���ο��� Ȯ�� ó�� 
				 * admit_flag == 0 (ó����) 
				 * admit_flag == 1 (���οϷ�)
				 */
				rsTray.get("admit_flag",i);
					
				if( rsTray.get("admit_flag").equals("1") ){
					admin_result = "ó����";
				}else{
					admin_result = "���οϷ�";
				}

				rsTray.add("admin_result", admin_result);
				System.out.println("admin_result"+admin_result);
				
				
				
				/*
				 *	���� ���н��� �۾� ���� ���� ó�� 
				 */
				
				if(rsTray.get("status",i).equals("0")){
					status_result = "�۾��Ϸ�";
				}
				
				String temp = rsTray.get("to_dt");
				
				System.out.println("to_dt: "+ temp);
				
				
				
					
			}
			
			
		} catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)���� �Ϲ� ���� �߻�", ex);
			}
		finally{
			request.setAttribute("rsTray", rsTray);
		}
	}
}


