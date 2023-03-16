package console.admin_backup.dao;

import java.sql.Connection;

import console.common.dao.BaseDao;
import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;




public class QaCommonDao extends BaseDao {

	public ResultSetTray findQiEtc(Connection conn, Tray reqTray) {
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query = new StringBuffer();
        query.append("SELECT DET.CODE_NO    QI_ETC          \n");
        query.append("      ,DET.CODE_VAL   QI_ETC_DESC     \n");
        query.append("FROM   QA_CODE_DETAIL DET             \n");
        query.append("      ,QA_CODE_MST    MST             \n");
        query.append("WHERE MST.TYPE_NO = DET.FK_TYPE_NO    \n");
        query.append("AND   MST.ACTIVE_FLAG = 'A'           \n");
        query.append("AND   DET.ACTIVE_FLAG = 'A'           \n");
        query.append("AND   MST.TYPE_NO = 1                 \n");
        query.append("ORDER BY DET.SORT_NO, DET.CODE_NO     \n");
        
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);

		return rsTray;
	}
	
	public ResultSetTray findGoodsList(Connection conn, Tray reqTray) {
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query = new StringBuffer();
        query.append("SELECT GOODS_CODE                      \n");
        query.append("      ,GOODS_NAME                      \n");
        query.append("FROM   TB_BG004                        \n");
        query.append("WHERE  GOODS_NAME LIKE :qi_goods_name  \n");
        if ( reqTray.getString("class_1").length() > 0 ) {
            query.append("AND    CLASS_1    = :class_1        \n");
            if ( reqTray.getString("class_2").length() > 0 ) {
                query.append("AND    CLASS_2    = :class_2        \n");
                if ( reqTray.getString("class_3").length() > 0 ) {
                    query.append("AND    CLASS_3    = :class_3        \n");
                    if ( reqTray.getString("class_4").length() > 0 ) {
                        query.append("AND    CLASS_4    = :class_4        \n");
                    }
                }
            }
        }

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);

		return rsTray;
	}
	
	public ResultSetTray findClass1(Connection conn, Tray reqTray) {
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query = new StringBuffer();
        query.append("SELECT CLASS_1              \n");
        query.append("      ,CLASS_1_DESC         \n");
        query.append("FROM   TB_BG064             \n");
        query.append("WHERE  ACTIVE_FLAG = 'Y'    \n");
        query.append("ORDER BY CLASS_1            \n");

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);

		return rsTray;
	}

	public ResultSetTray findClass2(Connection conn, Tray reqTray) {
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query = new StringBuffer();
        query.append("SELECT CLASS_2              \n");
        query.append("      ,CLASS_2_DESC         \n");
        query.append("FROM   TB_BG065             \n");
        query.append("WHERE  ACTIVE_FLAG = 'Y'    \n");
        query.append("AND    CLASS_1 = :class_1   \n");
        query.append("ORDER BY CLASS_1            \n");
        query.append("        ,CLASS_2            \n");

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);

		return rsTray;
	}

	public ResultSetTray findClass3(Connection conn, Tray reqTray) {
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query = new StringBuffer();
        query.append("SELECT CLASS_3              \n");
        query.append("      ,CLASS_3_DESC         \n");
        query.append("FROM   TB_BG066             \n");
        query.append("WHERE  ACTIVE_FLAG = 'Y'    \n");
        query.append("AND    CLASS_1 = :class_1   \n");
        query.append("AND    CLASS_2 = :class_2   \n");
        query.append("ORDER BY CLASS_1            \n");
        query.append("        ,CLASS_2            \n");
        query.append("        ,CLASS_3            \n");

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);

		return rsTray;
	}

	public ResultSetTray findClass4(Connection conn, Tray reqTray) {
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query = new StringBuffer();
        query.append("SELECT CLASS_4              \n");
        query.append("      ,CLASS_4_DESC         \n");
        query.append("FROM   TB_BG067             \n");
        query.append("WHERE  ACTIVE_FLAG = 'Y'    \n");
        query.append("AND    CLASS_1 = :class_1   \n");
        query.append("AND    CLASS_2 = :class_2   \n");
        query.append("AND    CLASS_3 = :class_3   \n");
        query.append("ORDER BY CLASS_1            \n");
        query.append("        ,CLASS_2            \n");
        query.append("        ,CLASS_3            \n");
        query.append("        ,CLASS_4            \n");

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);

		return rsTray;
	}

	public ResultSetTray findGoodsInfo(Connection conn, Tray reqTray) {
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query = new StringBuffer();
        query.append("SELECT BG004.GOODS_CODE    GOODS_CODE       \n");
        query.append("      ,BG004.GOODS_NAME    GOODS_NAME       \n"); 
        query.append("      ,BG004.CLASS_1         CLASS_1        \n");
        query.append("      ,BG004.CLASS_2         CLASS_2        \n");
        query.append("      ,BG004.CLASS_3         CLASS_3        \n");
        query.append("      ,BG004.CLASS_4         CLASS_4        \n");
        query.append("      ,BG064.CLASS_1_DESC    CLASS_1_DESC   \n");
        query.append("      ,BG065.CLASS_2_DESC    CLASS_2_DESC   \n");
        query.append("      ,BG066.CLASS_3_DESC    CLASS_3_DESC   \n");
        query.append("      ,BG067.CLASS_4_DESC    CLASS_4_DESC   \n");
        query.append("      ,BG004.FACTORY_NAME    FACTORY_NAME   \n");
        query.append("      ,BG004.NATIVE_COUNTRY  NATIVE_COUNTRY \n");
        query.append("      ,BG004.GOODS_DESC      GOODS_DESC     \n");
        query.append("FROM   TB_BG004 BG004                       \n");
        query.append("      ,TB_BG064 BG064                       \n");
        query.append("      ,TB_BG065 BG065                       \n");
        query.append("      ,TB_BG066 BG066                       \n");
        query.append("      ,TB_BG067 BG067                       \n");
        query.append("WHERE  BG004.CLASS_1 = BG064.CLASS_1        \n");
        query.append("AND    BG004.CLASS_1 = BG065.CLASS_1        \n");
        query.append("AND    BG004.CLASS_2 = BG065.CLASS_2        \n");
        query.append("AND    BG004.CLASS_1 = BG066.CLASS_1        \n");
        query.append("AND    BG004.CLASS_2 = BG066.CLASS_2        \n");
        query.append("AND    BG004.CLASS_3 = BG066.CLASS_3        \n");
        query.append("AND    BG004.CLASS_1 = BG067.CLASS_1        \n");
        query.append("AND    BG004.CLASS_2 = BG067.CLASS_2        \n");
        query.append("AND    BG004.CLASS_3 = BG067.CLASS_3        \n");
        query.append("AND    BG004.CLASS_4 = BG067.CLASS_4        \n");
        query.append("AND    BG004.GOODS_CODE = :qi_goods_code    \n");
        
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);

		return rsTray;
	}

	public ResultSetTray findQaClass1(Connection conn, Tray reqTray) {
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query = new StringBuffer();
        query.append("SELECT QI_CLASS_1           \n");
        query.append("      ,QI_CLASS_1_DESC      \n");
        query.append("FROM   QA_IT001             \n");
        query.append("WHERE  QI_ACTIVE_FLAG = 'Y' \n");
        query.append("ORDER BY QI_CLASS_1         \n");
        
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);

		return rsTray;
	}

	public ResultSetTray findQaClass2(Connection conn, Tray reqTray) {
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query = new StringBuffer();
        query.append("SELECT QI_CLASS_2               \n");
        query.append("      ,QI_CLASS_2_DESC          \n");
        query.append("FROM   QA_IT002                 \n");
        query.append("WHERE  QI_ACTIVE_FLAG = 'Y'     \n");
        query.append("AND    QI_CLASS_1 = :qi_class_1 \n");
        query.append("ORDER BY QI_CLASS_2             \n");

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);

		return rsTray;
	}

	public ResultSetTray findQaClass3(Connection conn, Tray reqTray) {
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query = new StringBuffer();
        query.append("SELECT QI_CLASS_3               \n");
        query.append("      ,QI_CLASS_3_DESC          \n");
        query.append("FROM   QA_IT003                 \n");
        query.append("WHERE  QI_ACTIVE_FLAG = 'Y'     \n");
        query.append("AND    QI_CLASS_1 = :qi_class_1 \n");
        query.append("AND    QI_CLASS_2 = :qi_class_2 \n");
        query.append("ORDER BY QI_CLASS_3             \n");
        
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);

		return rsTray;
	}
}