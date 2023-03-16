
package console.require.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;

public class RequireTestDao extends BaseDao{
	

	public ResultSetTray test(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		String test = reqTray.get("test");
		String test1 = reqTray.get("test1");
		
		test = "«Ï«Ï«Ï";
		
		reqTray.add("test", test);
		reqTray.add("test", test);
		
		System.out.println("=============== DAO test:" + test);
		System.out.println("=============== DAO test:" + test1);
		
//		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		
//		rsTray = (ResultSetTray)queryRunner.query(conn);
		

		
	return rsTray;
	}
}
