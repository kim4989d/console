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
				 * 유닉스용 승인여부 확인 처리 
				 * admit_flag == 0 (처리중) 
				 * admit_flag == 1 (승인완료)
				 */
				rsTray.get("admit_flag",i);
					
				if( rsTray.get("admit_flag").equals("1") ){
					admin_result = "처리중";
				}else{
					admin_result = "승인완료";
				}

				rsTray.add("admin_result", admin_result);
				System.out.println("admin_result"+admin_result);
				
				
				
				/*
				 *	현재 유닉스용 작업 상태 로직 처리 
				 */
				
				if(rsTray.get("status",i).equals("0")){
					status_result = "작업완료";
				}
				
				String temp = rsTray.get("to_dt");
				
				System.out.println("to_dt: "+ temp);
				
				
				
					
			}
			
			
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


