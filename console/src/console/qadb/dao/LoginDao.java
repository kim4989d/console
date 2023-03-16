package console.qadb.dao;

import java.sql.Connection;

import console.common.dao.BaseDao;
import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;




public class LoginDao extends BaseDao {
	
	public ResultSetTray findEmpInfo(Connection conn, Tray reqTray) {
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query = new StringBuffer();
      //  query.append("SELECT BB002.EMPL_PASSWD     EMPL_PASSWD     \n");
//        query.append("      ,INSTE01.EMP_NO        EMP_NO          \n");
//        query.append("      ,INSTE01.EMP_NM        EMP_NM          \n");
//        query.append("      ,INSTE01.FK_TITLE_DESC EMP_TITLE_DESC  \n");
//        query.append("      ,INSTE01.EMP_MAIL_ID   EMP_MAIL_ID     \n");
//        query.append("      ,INSTA01.DEPT_CD       DEPT_CD         \n");
//        query.append("      ,INSTA01.DEPT_NM       DEPT_NM         \n");
//        query.append("FROM  TB_BB002   BB002                       \n");
//        query.append("     ,QA_INSTE01 INSTE01                     \n");
//        query.append("     ,QA_INSTA01 INSTA01                     \n");
//        query.append("WHERE BB002.EMPL_NUMB = INSTE01.EMP_NO       \n");
//        query.append("AND   INSTE01.EMP_STATUS <> 'I'               \n");
//        query.append("AND   INSTE01.EMP_STATUS <> 'T'               \n");
//        query.append("AND   INSTE01.FK_DEPT_CD = INSTA01.DEPT_CD   \n");
//        query.append("AND   BB002.EMPL_NUMB = :user_id             \n");
    	
        query.append("SELECT USER_ID         \n");
        query.append("		FROM TEST        \n");
        query.append("   WHERE USER_ID=:user_id \n");
        
        //System.out.println("rsTray.tostring()    :"+rsTray.toString());
        queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
        //System.out.println("queryRunner  "+reqTray.getString("user_id"));
        rsTray = (ResultSetTray)queryRunner.query(conn);
		
		return rsTray;
	}

	public ResultSetTray findDeptAuth(Connection conn, Tray reqTray) {
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query = new StringBuffer();
		query.append("  SELECT QI_CLASS_1              \n");
		query.append("        ,QI_CLASS_2              \n");
		query.append("        ,QI_CLASS_3              \n");
		query.append("        ,QI_AUTH_1               \n");
		query.append("        ,QI_AUTH_2               \n");
		query.append("        ,QI_AUTH_3               \n");
		query.append("        ,QI_AUTH_4               \n");
		query.append("        ,QI_AUTH_5               \n");
		query.append("        ,QI_AUTH_6               \n");
		query.append("        ,QI_AUTH_7               \n");
		query.append("        ,QI_AUTH_8               \n");
		query.append("        ,QI_AUTH_9               \n");
		query.append("        ,QI_AUTH_10              \n");
		query.append("  FROM   QA_AUTH                 \n");
		query.append("  WHERE  QI_DEPT_CD = :dept_cd   \n");

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);

		return rsTray;
	}
}