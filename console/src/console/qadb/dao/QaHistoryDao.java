package console.qadb.dao;


import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;



public class QaHistoryDao {
	public int currPage;
	public int totalPage;
	public int LinePage=10;

//	
//	public void incrCnt(int num) throws SQLException,Exception{
//	
//			String query="UPDATE bang SET readcount = readcount + 1 where num=" + num; 
//	

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
		
	
	
	public ResultSetTray QnaList(Connection conn,Tray reqTray){
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int totalnum=0;
		
		System.out.println("currpage->"+currPage);
		String page=reqTray.get("page");
		if(page==null || page.equals("")){page="10";}
		System.out.println("page->"+page);
		String order=reqTray.get("order");	
		if(order==null || order.equals("")){order="0";}
		String next=reqTray.get("next");
		String prev=reqTray.get("prev");
		


//
//		
//		query.append("select			\n");
//		query.append(",QNA_NUM			\n");
//		query.append(",QNA_LEVEL		\n");
//		query.append(",QNA_STATUS 		\n");
// 		query.append(",QNA_TITLE		\n");
// 		query.append(",QNA_CONTENT		\n");
// 		query.append(",QNA_READ_CNT		\n");
//		query.append(",QNA_GOODS_CODE	\n");
//		query.append(",QNA_CREATED		\n");
//		query.append(",QNA_CREATED_ID	\n");
//		query.append(",QNA_CREATED_NM	\n");
//		query.append(",QNA_LAST_UPD		\n");
//		query.append(",QNA_LAST_UPD_ID	\n");
//		query.append(",QNA_LAST_UPD_NM	\n");
//		query.append(",QNA_REF 			\n");
//		query.append("from QA_QNA_LIST	\n");
//		
		
		
		
		
		query=new StringBuffer();
		query.append("select																\n");
		query.append("c.qi_class_2_desc									qi_class_2_desc,	\n");
		query.append("a.QI_CODE											qi_code,			\n");
		query.append("a.QI_TITLE										qi_title,			\n");
		query.append("a.CREATED_NM										qi_created_nm,		\n");
		query.append("a.QI_READ_CNT										qi_read_cnt,		\n");
		query.append(" to_char(a.CREATED, 'YYYY.MM.DD') 				created,			\n");
		query.append("decode(sign(sysdate-a.created-1), -1, 'new', '') 	new_flag 			\n");
		query.append("from																	\n");
		query.append(" tb_bg004 d,															\n");
		query.append("qa_it002 c,															\n");
		query.append(" qa_qi001 a															\n");


//		query.append("where rownum<=10														\n");
//		query.append("a.qi_status = 'A'														\n");
//		query.append("and   a.qi_class_1  = '001'											\n");
//		query.append("a.qi_goods_code = d.goods_code										\n");
//		query.append("and   a.qi_class_1 = c.qi_class_1										\n");
//		query.append("and   a.qi_class_2 = c.qi_class_2										\n");
//		query.append("and   d.class_1 = 'A15' 												\n");
//		query.append("and   d.class_2 = '01' 												\n");
//		query.append("and   d.class_3 = '12' 												\n");
//		query.append("and   d.class_4 = '00' 												\n");
//		query.append("order by a.created desc												\n");

		
		
		//		query.append("\n");
//		query.append("\n");
//		query.append("\n");
//										

		//		--  // 항목 - 노출항목
//		  c.qi_class_2_desc                                qi_class_2_desc, 
//		--   // 문서코드 - 문서링크시 사용
//		  a.QI_CODE                                        qi_code,         
//		--   // 제목 - 노출항목
//		  a.QI_TITLE                                       qi_title,        
//		--   // 생성자 - 노출항목
//		  a.CREATED_NM                                     qi_created_nm,   
//		--   // 조회수 - 노출항목
//		  a.QI_READ_CNT                                    qi_read_cnt,     
//		--    // 생성일
//		  to_char(a.CREATED, 'YYYY.MM.DD')                 created,        
//		--   // new 여부, 최근1일 생성된 문서가 new
//		  decode(sign(sysdate-a.created-1), -1, 'new', '') new_flag         
//
//
//
//		     from tb_bg004 d,
//		     qa_it002 c,
//		     qa_qi001 a

		
//		where a.qi_status = 'A'  
//			-- and   a.qi_class_1  = '001' // 품질이력 조회시

//		and   a.qi_goods_code = d.goods_code
//		and   a.qi_class_1 = c.qi_class_1
//		and   a.qi_class_2 = c.qi_class_2
//
	
// 대/중/소/세분류 조회시 4개의 파라미터을 설정  
//
//		and   d.class_1 = 'A15' 
//			 and   d.class_2 = '01'
//			 and   d.class_3 = '12'
//			 and   d.class_4 = '00'
//		 최근등록순
//		-- order by a.created desc 


		
		if(page.equals("10")){
			
			query.append("where rownum<=10														\n");
			query.append("and a.qi_status = 'A'													\n");
			query.append("and   a.qi_class_1  = '001'											\n");
			query.append("and a.qi_goods_code = d.goods_code									\n");
			query.append("and   a.qi_class_1 = c.qi_class_1										\n");
			query.append("and   a.qi_class_2 = c.qi_class_2										\n");
			query.append("and   d.class_1 = 'A15' 												\n");
			query.append("and   d.class_2 = '01' 												\n");
			query.append("and   d.class_3 = '12' 												\n");
			query.append("and   d.class_4 = '00' 												\n");
			int start=0;
			int end=0;
			if(currPage==1){
				start=currPage;
				end=currPage+9;
				query.append("and a.QI_CODE between "+start+" and "+end+"						\n");
				
				}else{
				if(currPage>=2){
				start=0;
				start=(currPage - 1) * LinePage;
				end=currPage * LinePage-1;
				query.append("and a.QI_CODE between "+start+" and "+end+"						\n");
				}
			}
			System.out.println("query->"+query.toString());
			
		}// if end
		
		else if(page.equals("20")){
			query.append("where rownum<=20 \n");
			
			if(currPage==1){
				int start=currPage;
				int end=currPage+3;
				query.append("and qna_num between "+ start+" and "+end   +"	\n");
		
			}else{
				int start=currPage+3;
				int end=currPage+6;
				query.append("and qna_num between "+ start+" and "+end   +"	\n");
				
				
			}
		}
					
		
		else if(page.equals("30")){
			int start=currPage-1;
			int end=currPage=1;
			query.append("where rownum<=30 \n");
			query.append("and qna_num between 1 and 2");
		}
		
//		if(order.equals("0")){query.append("order by QNA_CREATED_NM \n");}
//		else if(order.equals("1")){query.append("\n");}
//		else if(order.equals("2")){query.append("\n");}
//		
		System.out.println("query->"+query.toString());
			
		
		
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
