
package console.qadb.dao;


import java.sql.Connection;

import console.common.dao.BaseDao;
import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;



public class QaMainDao extends BaseDao{


	public int currPage;
	public int totalPage;
	public int LinePage=10;


	public String getPaging(int totalnum,String page,String paging) {
		if(page==null){page="10";}
		if(paging==null){paging="1";}
		
		System.out.println("totalnum:"+totalnum+"  page:"+page+" paging:"+paging);
		int pag=Integer.parseInt(page);
		int pagin=Integer.parseInt(paging);
		
		
		this.currPage=pagin;
		System.out.println("toto"+totalnum /pag);
		int totalPage = (int)Math.ceil(totalnum /pag ) + 1;
		System.out.println("totalPage:"+totalPage);
		StringBuffer sb=null;
		if(totalnum % pag==0)
		totalPage--;	
		
		this.totalPage = totalPage;
		System.out.println("totalPage--:"+totalPage);	
		sb=new StringBuffer();
		for(int i=1;i<=totalPage;i++){
			if(i !=pagin)
				sb.append("&nbsp;&nbsp;<font color=#A8A8A8><A href =/QADBServlet?cmd=qa_history&paging=" +i+"&page="+page+"> " + i + " </A>&nbsp;");
		    else
				 sb.append(" " + i + " ");

		
			
		}
		System.out.println("qna_db query->"+sb.toString());
		return sb.toString();	

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

//		query.append("and   d.class_1 = 'A15' 												\n");
//		query.append("and   d.class_2 = '01' 												\n");
//		query.append("and   d.class_3 = '12' 												\n");
//		query.append("and   d.class_4 = '00' 												\n");
//		//query.append("and a.QI_CODE between "+start+" and "+end+"						\n");
		//query.append("and a.QI_CODE between "+start+" and "+end+"						\n");
		System.out.println("query->"+query.toString());


		
		

		
		
		//		query.append("\n");
//		query.append("\n");
//		query.append("\n");
//										

		//		--  // �׸� - �����׸�
//		  c.qi_class_2_desc                                qi_class_2_desc, 
//		--   // �����ڵ� - ������ũ�� ���
//		  a.QI_CODE                                        qi_code,         
//		--   // ���� - �����׸�
//		  a.QI_TITLE                                       qi_title,        
//		--   // ������ - �����׸�
//		  a.CREATED_NM                                     qi_created_nm,   
//		--   // ��ȸ�� - �����׸�
//		  a.QI_READ_CNT                                    qi_read_cnt,     
//		--    // ������
//		  to_char(a.CREATED, 'YYYY.MM.DD')                 created,        
//		--   // new ����, �ֱ�1�� ������ ������ new
//		  decode(sign(sysdate-a.created-1), -1, 'new', '') new_flag         
//
//
//
//		     from tb_bg004 d,
//		     qa_it002 c,
//		     qa_qi001 a

		
//		where a.qi_status = 'A'  
//			-- and   a.qi_class_1  = '001' // ǰ���̷� ��ȸ��

//		and   a.qi_goods_code = d.goods_code
//		and   a.qi_class_1 = c.qi_class_1
//		and   a.qi_class_2 = c.qi_class_2
//
	
// ��/��/��/���з� ��ȸ�� 4���� �Ķ������ ����  
//
//		and   d.class_1 = 'A15' 
//			 and   d.class_2 = '01'
//			 and   d.class_3 = '12'
//			 and   d.class_4 = '00'
//		 �ֱٵ�ϼ�
//		-- order by a.created desc 


			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			rsTray = (ResultSetTray)queryRunner.query(conn);
		
		
		return rsTray;
	
	
	}

	
	public ResultSetTray ReList(Connection conn,Tray reqTray){
 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count=0;
		int temp=2;
		query=new StringBuffer();
		query.append("select qna_level		\n");
		query.append("from qa_qna_list where qna_level="+temp);
		
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		
		
	return rsTray;
	}
	public int getTotalNum(Connection conn,Tray reqTray){
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		query.append("select max(qna_num) as num from QA_QNA_LIST \n");
	
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		rsTray.getString("");
		this.totalPage=rsTray.getInt("num");
		return rsTray.getInt("num");
		
	}
}
