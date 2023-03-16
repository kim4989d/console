package console.qadb.dao;


import java.sql.Connection;

import console.common.dao.BaseDao;
import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;



public class QaGoodsDao extends BaseDao {
	public int currPage;
	public int totalPage;
	public int LinePage=10;

//	
//	public void incrCnt(int num) throws SQLException,Exception{
//	
//			String query="UPDATE bang SET readcount = readcount + 1 where num=" + num; 
//	
	public ResultSetTray HistoryList(Connection conn,Tray reqTray){
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int totalnum=0;
		
		
		query=new StringBuffer();
		query.append("select																\n");
		query.append("b.qi_class_2_desc									qi_class_2_desc,	\n");
		query.append("a.QI_CODE											qi_code,			\n");
		query.append("a.QI_TITLE										qi_title,			\n");
		query.append("a.CREATED_NM										qi_created_nm,		\n");
		query.append("a.QI_READ_CNT										qi_read_cnt,		\n");
		query.append(" to_char(a.CREATED, 'YYYY.MM.DD') 				created,			\n");
		query.append("decode(sign(sysdate-a.created-1), -1, 'new', '') 	new_flag 			\n");
		query.append("from																	\n");
		//query.append(" tb_bg004 d,															\n");
		query.append("qa_it002 b,															\n");
		query.append(" qa_qi001 a,															\n");
		query.append("tb_bg004 d															\n");
		query.append("where rownum<=5														\n");
		query.append("and a.qi_status = 'A'													\n");
		query.append("and   a.qi_class_1 = '001' 											\n");
		query.append("and a.qi_goods_code = d.goods_code									\n");
		query.append("and   a.qi_class_1 = b.qi_class_1										\n");
		query.append("and   a.qi_class_2 = b.qi_class_2										\n");
		query.append("order by a.created desc");

		System.out.println("query->"+query.toString());
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		return rsTray;
	
	
	}

	
	
		public ResultSetTray RegulationList(Connection conn,Tray reqTray){
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int totalnum=0;
	
		query=new StringBuffer();
		query.append("select																\n");
		query.append("b.qi_class_2_desc									qi_class_2_desc,	\n");
		query.append("a.QI_CODE											qi_code,			\n");
		query.append("a.QI_TITLE										qi_title,			\n");
		query.append("a.CREATED_NM										qi_created_nm,		\n");
		query.append("a.QI_READ_CNT										qi_read_cnt,		\n");
		query.append(" to_char(a.CREATED, 'YYYY.MM.DD') 				created,			\n");
		query.append("decode(sign(sysdate-a.created-1), -1, 'new', '') 	new_flag 			\n");
		query.append("from																	\n");
		query.append("qa_it002 b,															\n");
		query.append(" qa_qi001 a,															\n");
		query.append("tb_bg004 d															\n");
		query.append("where rownum<=5														\n");
		query.append("and a.qi_status = 'A'													\n");
		query.append("and   a.qi_class_1 = '002' 											\n");
		query.append("and a.qi_goods_code = d.goods_code									\n");
		query.append("and   a.qi_class_1 = b.qi_class_1										\n");
		query.append("and   a.qi_class_2 = b.qi_class_2										\n");
		query.append("order by a.created desc");

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
	
	return rsTray;
	}
	

	public ResultSetTray KnowledageList(Connection conn,Tray reqTray){
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int totalnum=0;
	
		query=new StringBuffer();
		query.append("select																\n");
		query.append("b.qi_class_2_desc									qi_class_2_desc,	\n");
		query.append("a.QI_CODE											qi_code,			\n");
		query.append("a.QI_TITLE										qi_title,			\n");
		query.append("a.CREATED_NM										qi_created_nm,		\n");
		query.append("a.QI_READ_CNT										qi_read_cnt,		\n");
		query.append(" to_char(a.CREATED, 'YYYY.MM.DD') 				created,			\n");
		query.append("decode(sign(sysdate-a.created-1), -1, 'new', '') 	new_flag 			\n");
		query.append("from																	\n");
		query.append("qa_it002 b,															\n");
		query.append(" qa_qi001 a,															\n");
		query.append("tb_bg004 d															\n");
		query.append("where rownum<=5														\n");
		query.append("and a.qi_status = 'A'													\n");
		query.append("and   a.qi_class_1 = '003' 											\n");
		query.append("and a.qi_goods_code = d.goods_code									\n");
		query.append("and   a.qi_class_1 = b.qi_class_1										\n");
		query.append("and   a.qi_class_2 = b.qi_class_2										\n");
		query.append("order by a.created desc");

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
	
	return rsTray;
	}

}
