package console.qadb.dao;


import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;



public class QaRegulationDao {

	public int currPage;
	public int totalPage;

	public String getPaging(int totalnum,String page,String paging) {
		if(page==null){page="2";}
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
				 sb.append("&nbsp;<A href =/QADBServlet?cmd=qa_regulation&paging=" +i+"&page="+page+"> " + i + " </A>&nbsp;");
		    else
				 sb.append(" " + i + " ");

		
			
		}
		System.out.println("qna_db query->"+sb.toString());
		return sb.toString();	

	}
		
	
	
	public ResultSetTray QaRegulationList(Connection conn,Tray reqTray){
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int totalnum=0;
		
		System.out.println("currpage->"+currPage);
		String page=reqTray.get("page");
		if(page==null || page.equals("")){page="2";}
		System.out.println("page->"+page);
		String order=reqTray.get("order");	
		if(order==null || order.equals("")){order="0";}
		String next=reqTray.get("next");
		String prev=reqTray.get("prev");
		



		query=new StringBuffer();
		query.append("select QNA_NUM,QNA_LEVEL,QNA_STATUS \n");
 		query.append(",QNA_TITLE,QNA_CONTENT,QNA_READ_CNT	\n");
		query.append(",QNA_GOODS_CODE,QNA_CREATED,QNA_CREATED_ID	\n");
		query.append(",QNA_CREATED_NM,QNA_LAST_UPD,QNA_LAST_UPD_ID	\n");
		query.append(",QNA_LAST_UPD_NM,QNA_REF from QA_QNA_LIST	\n");
		
		
		
		if(page.equals("2")){
			
			query.append("where rownum<=2 \n");
			
			if(currPage==1){
				int start=currPage;
				int end=currPage+1;
				query.append("and qna_num between "+start+" and "+end+"	\n");
			}else{
				if(currPage>=2){
					int start=0;
					start=currPage+1;
					int end=2;
					end=end+2;
					query.append("and qna_num between "+start+" and "+end+"	\n");
				}
			}
		}
		else if(page.equals("4")){
			query.append("where rownum<=4 \n");
			
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
					
		
		else if(page.equals("7")){
			int start=currPage-1;
			int end=currPage=1;
			query.append("where rownum<=7 \n");
			query.append("and qna_num between 1 and 2");
		}
		
		if(order.equals("0")){query.append("order by QNA_CREATED_NM \n");}
		else if(order.equals("1")){query.append("\n");}
		else if(order.equals("2")){query.append("\n");}
		
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
		return rsTray.getInt("num");
		
	}
	

}
