package console.product.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;

public class ProductDao extends BaseDao{
public String nextpage="";


/*
 * �ڵ���� ������ �ֿ� select ����
 * �ۼ���: �ֽ���
 */
	public ResultSetTray List(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
	
//		query.append("select vendor_id,vendor_name,reg_dt from TBL_VENDOR order by vendor_id \n");
		query.append("select vendor_id,vendor_name from TBL_VENDOR order by vendor_id \n");
		
		queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}
}	//Class }