package console.company.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;

public class CompanyDao extends BaseDao{
public String nextpage="";

/*
 * 코드관리 회사코드 주요 select 쿼리
 * 작성자: 최승주
 */
	public ResultSetTray List(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();

		query.append("select 										 \n");
		query.append("company_id, 									 \n");		
		query.append("date_format(REG_DT,'%Y/%m/%d %H:%i') as timeg, \n");
		query.append("company_name 									 \n");		
		query.append("from TBL_COMPANY 								 \n");
		query.append("order by company_id 							 \n");		
		
		queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}
}	//Class }