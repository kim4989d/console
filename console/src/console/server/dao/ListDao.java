//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능    : 시스템 장비에 관한 전체 DB
//특이  사항  :  
//작	 성  자   : 김 명 진 
//날         짜  : 2009-02-06
//======================================================================
package console.server.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.list.BoardBean;
import console.common.dao.BaseDao;

public class ListDao extends BaseDao{
//public String nextpage="";


//=======================================================================================
//						전체 레코드수 구하기 (엑셀다운)
//=======================================================================================
	public ResultSetTray EquipmentCount(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;

		query=new StringBuffer();
		
		query.append("		SELECT system_id FROM TBL_SYSTEM					\n"); //전체 레코드수 

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}
//	=====================================================================================
//						전체 레코드수 구하기 (엑셀다운)
//	=====================================================================================
		public ResultSetTray exceldown(Connection conn,Tray reqTray){
			 
			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			String STR_AND = "";
			query=new StringBuffer();
			
			//공통 값 들 
//			userid :web21 name:기태현 kindO
//			userid :web21 name:기태현 kindO
//			userid :web21 name:기태현 kindO		
			String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
			String name   	= 	reqTray.getString("name");			 // 사용자 이름
			String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 
			
			KIND = "A";												 // 임시 사용자 유형 값
			
			String div 			= reqTray.get("div");     // left 메뉴값  
			
			if (!div.equals("") && !div.equals("ALL")) { 
				STR_AND="and  upper(a.service_id)=upper('"+div+"') ";
			}
			
			query.append("	select b.service_name,a.system_name,a.system_id,a.reg_dt,    		\n");
			query.append(" ifnull(a.updt_dt,''),a.charger_id,a.system_ip,a.port,a.vendor_id,    \n");
			query.append("	a.session_policy_id,a.KOM,a.SANG_POS,a.BUN_NO,a.host_id 			\n");
			query.append(" from TBL_SYSTEM a left join 										    \n");
			query.append(" TBL_SERVICE b on a.service_id=b.service_id							\n");
			query.append("	where   b.service_id is not null 									\n"); 		//+STR_AND);

			if (KIND.equals("O")) {
			query.append("		and a.service_id in												\n");
			query.append("		(select service_id 												\n");
			query.append("			from TBL_SVC_USER											\n");
			query.append("		where charger_id=:SID											\n");
			}	
			query.append("	order by b.service_name ,a.system_id 								\n");

			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			rsTray = (ResultSetTray)queryRunner.query(conn);
			
			//reg_data
			System.out.println(rsTray);
		return rsTray;
		}

//=========================================================================================
//						장비 목록 불러 오기  (서비스 사용 장비 현황_장비 접속  )
//=========================================================================================
	public ResultSetTray EquipmentList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		//공통 값 들 
//		userid :web21 name:기태현 kindO
//		userid :web21 name:기태현 kindO
//		userid :web21 name:기태현 kindO
		
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 
		
		 // 임시 사용자 유형 값 
		//KIND = "A";														
		//KIND = "O";
		//KIND = "M";
		
		//userid = "web21";
		
		String div = reqTray.getString("div");
		if (div.equals("") || div == ""){div ="ALL";}
		
		String key = reqTray.getString("key"); 				 //key 값
		

		//String KIND = "A";								 //임시로 관리자 아이디 부여 
		
		String str_order = reqTray.getString("o"); 			 //type
		String str_value = reqTray.getString("s"); 			 //type
		//String SID = reqTray.getString("SID");			 //세션값 (ID)
		//String SID = "ngsadmin";                             //임시로 아디값 부여 

		if (str_value.equals(""))  str_value="0";				
		if (str_order.equals(""))  str_order= "system_id";			
		if (str_value.equals("1")) str_order = str_order + "  desc";		

		
		query=new StringBuffer();
		
		String STR_AND = "";
		if(!div.equals("") && !div.equals("ALL")) { 
			STR_AND=" and  upper(a.service_id)=upper('"+div+"')";   // left 메뉴  값 
		}
	 
		
		if (KIND.equals("A") || KIND.equals("O")){   							// 관리자 및 운용자 (매니저)
			System.out.println("관리자 및 운용자 ");
			query.append("select b.service_name,a.system_name,a.reg_dt,							\n ");
			query.append("ifnull(a.updt_dt,'') 													\n ");
			query.append("updt_dt, a.service_id,a.system_id ,									\n ");
			query.append("	a.OSTYPE ,a.host_id,a.system_ip										\n ");
			query.append(" from TBL_SYSTEM a left join 											\n "); 
			query.append("		TBL_SERVICE b on a.service_id=b.service_id  					\n ");
			query.append("	where b.service_id is not null "+STR_AND);
		if (KIND.equals("O")){
			
			query.append(" and a.service_id in (select service_id from 							\n ");
			query.append(" TBL_SVC_USER where charger_id='"+userid+"')"		);
			//query.append(" order by " + str_order					    );
			}
		}else if (KIND.equals("M") || KIND.equals("G")){ 			 			// 일반 사용자 
			System.out.println("일반 사용자  ");
			query.append("	select c.service_name, b.system_name, d.reg_dt, 					\n ");
			query.append("			ifnull(a.updt_dt,'') updt_dt, a.service_id,a.system_id  	\n ");
			query.append("	from TBL_SYSTEM a left join											\n ");
			query.append("			TBL_SERVICE b on a.service_id=b.service_id 					\n ");
			query.append("	where b.service_id is not null										\n ");
			query.append(" 	and d.system_id = b.system_id 										\n ");
			query.append(STR_AND);
		}
		
		System.out.println("$$$$$$$$$$$$$$$$$$$ "+reqTray.getString("txtsearch"));
		System.out.println("$$$$$$$$$$$$$$$$$$$ "+reqTray.getString("selectoption"));
		
		
		if(!reqTray.getString("txtsearch").equals("")){
			String value = reqTray.getString("txtsearch"); //txtsearch 검색 명 
			System.out.println(value+"========================");
																	 // like 함수 표현 방식(페이지 모든 검색조건이 이렇게 구성되어 있음
			if(reqTray.getString("selectoption").equals("SYSTEMID")){query.append("  AND a.host_id like "); //like 함수 표현 방식(페이지 모든 검색조건이 이렇게 구성되어 있음
																	query.append("'%");
																	query.append(value);
																	query.append("%'"); }  
			if(reqTray.getString("selectoption").equals("SYSTEMNAME")){query.append("  AND a.service_id like ");
																	query.append("'%");
																	query.append(value);
																	query.append("%'"); }  
//			bu.append("order by	system_id						        			                                    \n");
			}
		
		if (KIND.equals("A") || KIND.equals("O"))
		{
			query.append(" order by "+str_order			);
		}
		else
		{	
			query.append(" and d.user_id = '"+userid+"'"	);	
		}
		
			

		
		
		
			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}
//===========================================================================
//					장비 목록 불러 오기  (서비스 관리  장비 현황   )
//===========================================================================
public ResultSetTray EquipmentListDel(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		//공통 값 들 
//		userid :web21 name:기태현 kindO
//		userid :web21 name:기태현 kindO
//		userid :web21 name:기태현 kindO
		
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 

//		KIND = "A";												 // 임시 사용자 유형 값
		
		String div = reqTray.getString("div");
		if (div == "" || div.equals("")) div ="ALL";
		
		String key = reqTray.getString("key"); 				 //key 값

		String str_order = "";
		String str_value = "";
//		String SID = "";
		str_order =reqTray.getString("o"); 					//type
		str_value = reqTray.getString("s"); 				//type
//		SID = reqTray.getString("SID");						//세션값 (ID)
//		SID = "CONSOLE";									//임시로 ID 값 부여 
		
		if (str_value.equals(""))	 str_value="0";				
		if (str_order.equals("")) 	 str_order="  system_id";			
		if (str_value.equals("1"))   str_order = str_order+"  desc";		
		
		
		query=new StringBuffer();
		String STR_AND = "";
		if (!div.equals("") && !div.equals("ALL")) { 
			STR_AND=" and  upper(a.service_id)=upper('"+div+"')";   // left 메뉴  값 								
		}
		query.append("select b.service_id,a.system_name,a.system_id,a.reg_dt,					\n");
		query.append("ifnull(a.updt_dt,'') updt_dt,a.charger_id, a.OSTYPE,a.system_ip,a.HOST_ID \n");
		query.append("from TBL_SYSTEM a left join TBL_SERVICE b on a.service_id=b.service_id 	\n");
		query.append("where   b.service_id is not null "+STR_AND);
		if (KIND.equals("O")) {
		query.append("and a.service_id in 														\n"); 
		query.append("(select service_id from TBL_SVC_USER where charger_id='"+userid+"'))		\n");
		}	

		
		System.out.println("$$$$$$$$$$$$$$$$$$$ "+reqTray.getString("txtsearch"));
		System.out.println("$$$$$$$$$$$$$$$$$$$ "+reqTray.getString("selectoption"));
		
		
		if(!reqTray.getString("txtsearch").equals("")){
		
		String value = reqTray.getString("txtsearch");
		System.out.println(value+"========================");
		if(reqTray.getString("selectoption").equals("SYSTEMID")){query.append("  AND a.host_id like "); //like 함수 표현 방식(페이지 모든 검색조건이 이렇게 구성되어 있음
													query.append("'%");
													query.append(value);
													query.append("%'"); }  
		if(reqTray.getString("selectoption").equals("SYSTEMNAME")){query.append("  AND a.service_id like ");
													query.append("'%");
													query.append(value);
													query.append("%'"); 
													}  
		}
		query.append(" order by "+str_order			);
		//else{
		//bu.append("order by a."+str_order);
		//}
		
		
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
//reg_data

return rsTray;
}
//	=========================================================================================
//								서비스 사용 장비 현황_삭제(TBL_SYSTEM)
//=========================================================================================	
	public ResultSetTray EquipmentListDelOk(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		int count   	= 0;
		
		// 공통 값 
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 
		
			query = new StringBuffer();
		// KIND = reqTray.get("kind");   						// 실제 사용자 값 받아 오기 
			
					
			query.append("	delete from TBL_SYSTEM where system_id =:system_id		\n");
			if( KIND.equals("O")) {
				query.append("	 and charger_id='"+userid+"'							\n");
					}

			 queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			 count = queryRunner.update(conn);					//Update처리 Methode
			 System.out.println("UpPos count:  "+count);

//		reg_data

		return rsTray;
		}
//=========================================================================================
//						서비스 사용 장비 현황_삭제(TBL_USER_SYSTEM)
//=========================================================================================	
public ResultSetTray EquipmentListDelOk2(Connection conn,Tray reqTray){

			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			
			int count 		= 0;
			
			// 공통 값 
			String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
			String name   	= 	reqTray.getString("name");			 // 사용자 이름
			String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 
			
			query = new StringBuffer();
			KIND = reqTray.get("kind");
			

			
			query.append("	delete from TBL_USER_SYSTEM where system_id=:system_id		\n");
			
			 queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			 count = queryRunner.update(conn);	//Update처리 Methode
			 System.out.println("UpPos count:  "+count);

//reg_data

return rsTray;
}
//=========================================================================================
//						서비스 사용 장비 현황_삭제 전 TBL_SYSTEM_HISTORY 에 저장 
//=========================================================================================
	public ResultSetTray EquipmentListDel(Connection conn,Tray reqTray, Tray rsTray_H){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		
		int count 			= 0;
		int port  			= 0;
		int bun_no			= 0;
		
		// 공통 값 
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 


		System.out.println("===================================================");
		System.out.println(rsTray_H);
		System.out.println("===================================================");
		query = new StringBuffer();
		
			
		//해당 STRING 를 integer형을 변환후 DB 저장
		port = rsTray_H.getInt("port");
		bun_no = rsTray_H.getInt("bun_no");
		
		query.append("insert into TBL_SYSTEM_HISTORY 	 							\n");
		query.append("	(SYSTEM_ID,													\n"); 
		query.append("		SERVICE_ID ,											\n");
		query.append("			SYSTEM_NAME,										\n");
		query.append("				SYSTEM_IP,										\n");
		query.append("					PORT,										\n");
		query.append("						CHARGER_ID,								\n");
		query.append("							VENDOR_ID,							\n");
		query.append(" 	KOM,														\n");
		query.append("			SANG_POS,											\n");
		query.append("				BUN_NO,											\n");
		query.append("					OSTYPE,										\n"); 
		query.append("						REG_DT,									\n");
		query.append("							REG_ID,								\n");
		query.append("								host_id,						\n"); 
		query.append("				gubun) values (									\n");
		// 실제 데이타 저장 부분 values(==>
		query.append(":system_id,													\n"); 
		query.append("		:service_id ,											\n");
		query.append("			:system_name,										\n");
		query.append("				:system_ip,										\n");
		query.append(port);    										//integer 형으로 변환후 port를 받아옴 
		//bu.append("					:port,									\n");
		query.append("					,	:charger_id,							\n");
		query.append("							:vendor_id,							\n");
		query.append(" 	:kom,														\n");
		query.append("			:sang_pos,											\n");
		query.append(bun_no);										//integer 형으로 변환후bun_no를 받아옴				
		//bu.append("				:bun_no,										\n");
		query.append("					,:ostype,									\n"); 
		query.append("						now(),									\n");
		query.append("							'"+userid+"',							\n");
		query.append("								:host_id,						\n"); 
		query.append("				'D'                      )                 		\n");

		 queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		 count = queryRunner.update(conn);	//Update처리 Methode
		 System.out.println("UpPos count:  "+count);

//reg_data

return rsTray;
}

//=========================================================================================
//				      삭제 하기전 SYSTEM_HISTORY에 정보를 저장을 위하여 값을 받아옴  
//=========================================================================================
	public ResultSetTray EquipmentListDelInsert(Connection conn,Tray reqTray){
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query    	   = null;
		
		// 공통 값 
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 

		
		query=new StringBuffer();
		
		query.append(" select  SYSTEM_ID,SERVICE_ID,SYSTEM_NAME,				\n");
		query.append("		SYSTEM_IP,PORT,CHARGER_ID,VENDOR_ID, 				\n");
		query.append("			KOM,SANG_POS,BUN_NO,OSTYPE,host_id 				\n");
		query.append("	from TBL_SYSTEM where  system_id=:system_id				\n");
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
		return rsTray;
		}

//====================================================================================
//								포트 번호 불러 오기 
//====================================================================================
	public ResultSetTray ListReq(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;

		query=new StringBuffer();
		
		// 공통 값 
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 

		
		System.out.println("포트번호 ");
		query.append("select seqno from TBL_PORT_LIST order by seqno  \n"); 
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}

//======================================================================
//							소속 서비스 읽어 오기 
//======================================================================	
	public ResultSetTray ListReq2(Connection conn,Tray reqTray){  
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		int count			=	0;
		int temp			=	2;
		
		// 공통 값 
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 

		query=new StringBuffer();
		
//		SID = reqTray.getString("SID");
//		SID = "ngsadmin";						 //임시 아디값 부여 
		
		System.out.println("소속 서비스 ");
		if (KIND.equals("O")) {
			query.append("select a.service_id,b.service_name 								\n");
			query.append("		from TBL_SVC_USER a,TBL_SERVICE b 							\n");
			query.append("			where a.service_id=b.service_id and a.charger_id=	    \n");
			query.append(userid);
			query.append("order by service_id \n");
		}else{ //if (KIND =="A") {
			query.append("select service_id from TBL_SERVICE order by service_id");
		}
	
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}
	
//======================================================================
//								담당자 데이타 불러옴  
//======================================================================
	public ResultSetTray ListReq3(Connection conn,Tray reqTray){ 
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		int count	= 0;
		int temp	= 2;
		
		// 공통 값 
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 
		
		query=new StringBuffer();
		
		System.out.println("담당자 ");
		query.append("select user_id,name from TBL_USER    				 	\n");
		query.append("where admit_flag='1' and kind ='O' order by name desc \n");  
		
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}
//======================================================================
//							제조사 데이타 불러움 
//======================================================================
	public ResultSetTray ListReq4(Connection conn,Tray reqTray){ 
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		int count	= 0;
		int temp	= 2;
		
		// 공통 값 
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 
		
		query=new StringBuffer();
		
		System.out.println("제조사");
		query.append("select vendor_id,vendor_name    						\n"); 
		query.append("from TBL_VENDOR  order by vendor_name desc 			\n");  

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}
	
//======================================================================
//							TBL_SYSTEM 값을 비교 
//======================================================================
	public ResultSetTray ServerReqOk(Connection conn, Tray reqTray){ 
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;

		query=new StringBuffer();
		
		// 공통 값 
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 
		
		System.out.println("TBL_SYSTEM 값을 비교 해줌");
		
		query.append("select count(system_id) cnt 						\n");
		query.append("from TBL_SYSTEM where system_id=:system_id 		\n");

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		System.out.println("==========================================");
		System.out.println(rsTray);
		System.out.println("==========================================");
		
		//reg_data
		
	return rsTray;
	}

//======================================================================
//						service_id, charger_id 값 중복 확인  
//======================================================================
public ResultSetTray ServerReqOk2(Connection conn, Tray reqTray){
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		
		// 공통 값 
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 
		
		System.out.println("service_id , charger_id 값을 비교 해줌");
		
		query.append("		select service_id										\n");
		query.append("     from TBL_SVC_USER 										\n");
		query.append("		where service_id=:service_id and charger_id=:oper_id	\n");	

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		System.out.println("==========================================");
		System.out.println(rsTray);
		System.out.println("==========================================");
		//reg_data
		
	return rsTray;
	}

//======================================================================
//					OS_TYPE=="W" 이면 이 구문을 실행 (포트 번호 구하기)
//======================================================================
public ResultSetTray ServerReqOk3(Connection conn, Tray reqTray){ 
	
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	
	query=new StringBuffer();
	
	// 공통 값 
	String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
	String name   	= 	reqTray.getString("name");			 // 사용자 이름
	String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 
	
	System.out.println("PORT 값을 SELECT");
	
	query.append("		SELECT PORT												\n");
	query.append("     FROM TBL_PORT_LIST 										\n");
	query.append("		WHERE SEQNO=:win_port									\n");	
	queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
	rsTray = (ResultSetTray)queryRunner.query(conn);

	
	System.out.println("==========================================");
	System.out.println(rsTray);
	System.out.println("==========================================");
	//reg_data
	
return rsTray;
}
//======================================================================
//								시스템 등록 하기 
//====================================================================== 
public ResultSetTray ServerReqOk4(Connection conn, Tray reqTray, int port){ 
	
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	int count = 0;
	
	// 공통 값 
	String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
	String name   	= 	reqTray.getString("name");			 // 사용자 이름
	String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디 
	
	String ip_addr = (reqTray.get("ip_addr1")+".")+(reqTray.get("ip_addr2")+".") //IP 단일화
						+(reqTray.get("ip_addr3")+".")+(reqTray.get("ip_addr4"));
	
	System.out.println("======================");
	System.out.println(ip_addr);
	
	
	String wip_addr = (reqTray.get("wip_addr1")+".")+(reqTray.get("wip_addr2")+".") //IP 단일화 
						+(reqTray.get("wip_addr3")+".")+(reqTray.get("wip_addr4"));
	
	System.out.println("======================");
	System.out.println(wip_addr);
	

	if (reqTray.get("system_name") == "") {
		String system_name = reqTray.get("system_name");
		system_name = null;
		reqTray.getString("system_name",0);
	}
	
	query=new StringBuffer();

	//insert  
	query.append("		insert into TBL_SYSTEM (							\n");
	query.append("			SYSTEM_ID,										\n");
	query.append("			SERVICE_ID ,									\n");
	query.append("			SYSTEM_NAME,									\n");							
	query.append("			SYSTEM_IP,										\n");
	query.append("			PORT,											\n");
	query.append("			SESSION_POLICY_ID,								\n");
	query.append("			CHARGER_ID,										\n");
	query.append("			VENDOR_ID,										\n");
	query.append("		 	 KOM,											\n");
	query.append("			SANG_POS,										\n");
	query.append("			BUN_NO,											\n");
	query.append("			OSTYPE,											\n");
	query.append("			REG_DT,											\n");
	query.append("			REG_ID,											\n");
	query.append("			fixedflag,										\n");
	query.append("			host_id) values (								\n");
	//=====================================================================
							 //실제 데이타 저장 
	query.append("			:system_id, :service_id, :system_name,			\n");
	
	if(reqTray.get("os_type").equals("U") || reqTray.get("os_type")=="U") {
		query.append("'"+ip_addr+"'											\n");
	query.append("			,:port_no,										\n");
	}else{
		query.append("'"+wip_addr+"'										\n");
	query.append(","+port+","); //PORT 값을 불러옴
	}	
	query.append("		'',:oper_id,:vendor_id,								\n");
	query.append("			:kom,:sang_pos,0,:os_type,NOW(),			\n");
	query.append("			'"+userid+"',										\n");
	if (reqTray.get("fixport").equals("") || reqTray.get("os_type").equals("W") || reqTray.get("os_type").equals(null)) {			
		query.append("0,:system_id						)					\n");
	 }else{
		 query.append(":fixport,:system_id				) 					\n");
	 }

	 queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
	 count = queryRunner.update(conn);	//Update처리 Methode
	 System.out.println("UpPos count:  "+count);
	
	//reg_data
	
return rsTray;
}
//======================================================================
//							시스템 HISTORY 등록 하기 
//======================================================================
public ResultSetTray ServerReqOk5(Connection conn, Tray reqTray, int port){ 
	
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	int count = 0;

	// 공통 값 
	String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
	String name   	= 	reqTray.getString("name");			 // 사용자 이름
	String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디
	//SID = reqTray.getString("SID");
	
	//================================================================================
	//IP 단일화(UNIX)
	String ip_addr = (reqTray.get("ip_addr1")+".")+(reqTray.get("ip_addr2")+".") 
						+(reqTray.get("ip_addr3")+".")+(reqTray.get("ip_addr4"));
	
	System.out.println("======================");
	System.out.println(ip_addr);
	
	 //IP 단일화 (WINDOW)
	String wip_addr = (reqTray.get("wip_addr1")+".")+(reqTray.get("wip_addr2")+".")
						+(reqTray.get("wip_addr3")+".")+(reqTray.get("wip_addr4"));
	
	System.out.println("======================");
	System.out.println(wip_addr);

	
	
	// 데이타가 비교값 

	if (reqTray.get("system_name").equals("")) {
		reqTray.getString("system_name",0);
	}
	
	query=new StringBuffer();

	//insert  
	query.append("		insert into TBL_SYSTEM_HISTORY (				\n");
	query.append("			SYSTEM_ID,									\n");
	query.append("			SERVICE_ID ,								\n");
	query.append("			SYSTEM_NAME,								\n");							
	query.append("			SYSTEM_IP,									\n");
	query.append("			PORT,										\n");
	query.append("			SESSION_POLICY_ID,							\n");
	query.append("			CHARGER_ID,									\n");
	query.append("			VENDOR_ID,									\n");
	query.append("		 	 KOM,										\n");
	query.append("			SANG_POS,									\n");
	query.append("			BUN_NO,										\n");
	query.append("			OSTYPE,										\n");
	query.append("			REG_DT,										\n");
	query.append("			REG_ID,										\n");
	query.append("			fixedflag,									\n");
	query.append("			host_id,									\n");
	query.append("			gubun) values (								\n");
	//================================================================================
	query.append("			:system_id, :service_id, :system_name,		\n");
	//======================OS_TYPE별 포트 번호  =========================================
	if(reqTray.get("os_type").equals("U")) {
	query.append("'"+ip_addr+"'											\n");
	query.append("			,:port_no,									\n");
	}else{
	query.append("'"+wip_addr+"'										\n");
	query.append(","+port+","); //PORT 값을 불러옴 
	}	
	//====================조건문 끝 ===================================================
	query.append("		'',:oper_id,:vendor_id,							\n");
	query.append("			:kom,:sang_pos,:bun_no,:os_type,NOW(),		\n");
	query.append("			'"+userid+"',									\n"); //임시 아이디 값을 넣엇음 
	 if (reqTray.get("fixport").equals("") || reqTray.get("os_type").equals("W") || reqTray.get("os_type").equals(null)) {			
		 query.append("0,:system_id,'I'			)						\n");
	 }else{
		 query.append(":fixport,:system_id,'I'	) 						\n");
	 }
	 
	 
	 queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
	 count = queryRunner.update(conn);	//Update처리 Methode
	 System.out.println("UpPos count:  "+count);
	
	//reg_data
	
return rsTray;
}
//====================================================================================
//									수정할 목록  불러오기  
//====================================================================================
public ResultSetTray  ListEdit(Connection conn,Tray reqTray){
	 
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;

	query=new StringBuffer();
	
	// 공통 값 
	String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
	String name   	= 	reqTray.getString("name");			 // 사용자 이름
	String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디
	
	System.out.println("수정 목록 불러 오기  ");
	query.append("		select service_id,system_name,system_ip,					\n");
	query.append("			port,session_policy_id,charger_id,vendor_id,			\n"); 
	query.append("				kom,sang_pos,bun_no,ostype,fixedflag,HOST_ID  		\n");
	query.append("		from TBL_SYSTEM 											\n"); 
	query.append("			where system_id=:system_id								\n");
	
	queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
	rsTray = (ResultSetTray)queryRunner.query(conn);
	
	//reg_data
	
return rsTray;
}
//====================================================================================
//								수정할 PORT 불러오기  
//====================================================================================
public ResultSetTray  ListEditPort(Connection conn,Tray reqTray, String NT_port){
	 
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;

	query=new StringBuffer();
	int port = 0;
	
	// 공통 값 
	String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
	String name   	= 	reqTray.getString("name");			 // 사용자 이름
	String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디
	
	port = Integer.parseInt(NT_port);		//포트 번호 INTEGER 로 가공 하기 
	
	query.append("	SELECT SEQNO FROM TBL_PORT_LIST WHERE PORT="+port);
	
	queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
	rsTray = (ResultSetTray)queryRunner.query(conn);
	
	//reg_data
	
return rsTray;
	}
//====================================================================================
//								수정할 SeqNo 불러오기  
//====================================================================================
public ResultSetTray  ListEditSeqNo (Connection conn,Tray reqTray){
	 
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;

	query=new StringBuffer();
	
	// 공통 값 
	String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
	String name   	= 	reqTray.getString("name");			 // 사용자 이름
	String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디
	
	query.append("select ifnull(max(SEQNO),0)+1 from TBL_PORT_WORK");
	
	queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
	rsTray = (ResultSetTray)queryRunner.query(conn);
	
	//reg_data
	
return rsTray;
	}
//====================================================================================
//					os_type 가 NT(W)일 경우 수정할 PORT , OLD_PORT 구하기 
//====================================================================================
	public ResultSetTray  ListEditSeqPortW (Connection conn,Tray reqTray){
	
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	
	String os_type 		= 	"";
	String temp_type	=	"";
	
	query=new StringBuffer();
	os_type = reqTray.getString("os_type");
	temp_type = reqTray.getString("temp_type");
	
//	if (os_type.equals("W") && temp_type.equals("W")) 
		query.append("			SELECT A.PORT AS OLD_PORT ,  				\n");
		query.append("       B.PORT AS NEW_PORT 							\n");
		query.append(" 		 FROM TBL_PORT_LIST A, 							\n");
		query.append("       TBL_PORT_LIST B   								\n");
		query.append(" 		 WHERE A.SEQNO 	=:temp_port						\n");
		query.append("  			  AND B.SEQNO =:win_port				\n");
	
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
	
	//reg_data
	
	return rsTray;
}
//====================================================================================
//								수정(PORT_UPDATE)업데이트 하기 
//====================================================================================
	public ResultSetTray  ListEditSeqPortUp (Connection conn,Tray reqTray ,int seqNo, Tray rsTray2 ){
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		
		query=new StringBuffer();
		
		// 공통 값 
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디
		
		String os_type = reqTray.getString("os_type");
		String temp_type = reqTray.getString("temp_type");
		int win_port = reqTray.getInt("win_port");
		int temp_port = reqTray.getInt("temp_port");
		
		//IP 단일화 (WINDOW)
		String wip_addr = (reqTray.get("wip_addr1")+".")+(reqTray.get("wip_addr2")+".")
							+(reqTray.get("wip_addr3")+".")+(reqTray.get("wip_addr4"));
		System.out.println("======================");
		System.out.println(wip_addr);
		
		if ((os_type.equals("W") && temp_type.equals("W")) && (temp_port != win_port) && temp_port !=23) {
	
//		if (os_type.equals("W") && temp_type.equals("W")) 
			query.append("		INSERT INTO TBL_PORT_WORK 							\n");
		query.append("			(   SEQNO,IP,PORT,NEWPORT,NDONE_FLAG,INS_DT    ) 	\n");
		query.append("					VALUES 	(									\n");
		query.append(seqNo+",														\n");
		query.append("'"+wip_addr+"',												\n");
		query.append("			:OLD_PORT,											\n");
		query.append("			:NEW_PORT,											\n");
		query.append("0"+",															\n");
		query.append("NOW()								)							\n");
			
//			$OLD_PORT = $row["OLD_PORT"];
//			$NEW_PORT = $row["NEW_PORT"];
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		count = queryRunner.update(conn);	//Update처리 Methode
		System.out.println("UpPos count:  "+count);
		}
		//reg_data
		
		return rsTray;
	}
//====================================================================================
//					TEMP_TYPE 이UNIX(U) 일 경우 수정할  PORT , OLD_PORT 구하기 
//====================================================================================
	public ResultSetTray  ListEditSeqPortU (Connection conn,Tray reqTray){
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		
		// 공통 값 
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디
		
		String os_type = reqTray.getString("os_type");
		String temp_type = reqTray.getString("temp_type");
		
		//if (os_type.equals("W") && temp_type.equals("W")) 
		query.append("	SELECT PORT 							\n");
		query.append("		FROM TBL_PORT_LIST 					\n");
		query.append("			WHERE SEQNO=:win_port			\n");
		
		//$OLD_PORT = $row["OLD_PORT"];
		//$NEW_PORT = $row["NEW_PORT"];
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
		return rsTray;
}
//====================================================================================
//							UPDATE TBL_SYSTEM 
//====================================================================================
	public ResultSetTray  UPDATE_TBL_SYSTEM  (Connection conn,Tray reqTray, int new_port){
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		
		// 공통 값 
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디
		//String SID = "ngsadmin"; //임시 아이디 값
		//SID = reqTray.getString("SID");
		
		query=new StringBuffer();
		String os_type 		= reqTray.getString("os_type");
		String temp_type 	= reqTray.getString("temp_type");
		String fixport 		= reqTray.getString("fixport");
		
	//IP 단일화(UNIX)
		String ip_addr = (reqTray.get("ip_addr1")+".")+(reqTray.get("ip_addr2")+".") 
							+(reqTray.get("ip_addr3")+".")+(reqTray.get("ip_addr4"));
		System.out.println("======================");
		System.out.println(ip_addr);
			
	//IP 단일화 (WINDOW)
		String wip_addr = (reqTray.get("wip_addr1")+".")+(reqTray.get("wip_addr2")+".")
							+(reqTray.get("wip_addr3")+".")+(reqTray.get("wip_addr4"));
		System.out.println("======================");
		System.out.println(wip_addr);
		
		query.append("		update TBL_SYSTEM set 						\n");
		query.append("			service_id=:service_id	,				\n");
		query.append("				system_name=:system_name,			\n");
		
		if (os_type.equals("U")) {
			query.append("	SYSTEM_IP='"+ip_addr+"',					\n");
		query.append("		PORT=:port_no,								\n");
		}else{
			query.append("			SYSTEM_IP='"+wip_addr+"',			\n");
			
		query.append("				PORT =								\n");
		query.append(new_port+",										\n");
		}
		query.append("				SESSION_POLICY_ID=:policy_id,		\n");
		query.append("				CHARGER_ID=:oper_id	,				\n");
		query.append("				VENDOR_ID=:vendor_id,				\n");
		query.append("				KOM=:kom,							\n");
		query.append("				SANG_POS=:sang_pos,					\n");
		query.append("				BUN_NO=:bun_no,						\n");
		query.append("				OSTYPE=:os_type	,					\n");
		query.append("				fixedflag=							\n");
		
		if (fixport.equals("") || os_type.equals("W"))  fixport="0";	
		query.append(fixport+",											\n");
		
		query.append("				UPDT_DT= NOW(),						\n");
		query.append("				UPDT_ID='"+userid+"',					\n");
		query.append("				HOST_ID=:host_id					\n");
		query.append("				where system_id=:system_id			\n");

		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		count = queryRunner.update(conn);	//Update처리 Methode
		System.out.println("UpPos count:  "+count);
		
		//reg_data
		
		return rsTray;
}
//====================================================================================
//							TBL_SYSTEM_HISTORY 삽입  
//====================================================================================
	public ResultSetTray  TblSystem_History_In  (Connection conn,Tray reqTray, int new_port){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		String SID = "ngsadmin"; //임시 아이디 값
		//SID = reqTray.getString("SID");
		
		query=new StringBuffer();
		String os_type 		= reqTray.getString("os_type");
		String temp_type 	= reqTray.getString("temp_type");
		String fixport 		= reqTray.getString("fixport");
		
		//================================================================================
		//IP 단일화(UNIX)
		String ip_addr = (reqTray.get("ip_addr1")+".")+(reqTray.get("ip_addr2")+".") 
			+(reqTray.get("ip_addr3")+".")+(reqTray.get("ip_addr4"));
		
		System.out.println("======================");
		System.out.println(ip_addr);
		
		//IP 단일화 (WINDOW)
		String wip_addr = (reqTray.get("wip_addr1")+".")+(reqTray.get("wip_addr2")+".")
			+(reqTray.get("wip_addr3")+".")+(reqTray.get("wip_addr4"));
		
		System.out.println("======================");
		System.out.println(wip_addr);
		
		query.append("			insert into TBL_SYSTEM_HISTORY 							\n");
		query.append("				(SYSTEM_ID,SERVICE_ID ,SYSTEM_NAME,SYSTEM_IP,		\n");
		query.append("					PORT,SESSION_POLICY_ID,CHARGER_ID,VENDOR_ID,	\n");
		query.append(" 		KOM,SANG_POS,BUN_NO,OSTYPE,REG_DT,							\n");
		query.append("			REG_ID,fixedflag,host_id,gubun) values (				\n");
		query.append(" 	:system_id,														\n");
		query.append("		:service_id,												\n");
		query.append("		:system_name,												\n");
																							  //os_type 별로 ip 넣어 주기 
		if 	(os_type.equals("U")){															  //UNIX 일 경우 
		query.append("'"+ip_addr+"',													\n");
		query.append("		:port_no,													\n");
		}else{							//NT 일 경우 
		query.append("'"+wip_addr+"',												\n");
		query.append(new_port+",														\n");
		}	
		query.append("		:policy_id,													\n");
		query.append("		:oper_id,													\n");
		query.append("		:vendor_id,													\n");
		query.append("		:kom,														\n");
		query.append("		:sang_pos,													\n");
		query.append("		0,													\n");
		//query.append("		:bun_no,													\n");
		query.append("		:os_type,													\n");
		query.append("		now(),														\n");
		query.append("'"+SID+"',														\n"); //임시 아이디  값 
		query.append("				fixedflag=											\n");
		if (fixport.equals("") || os_type.equals("W"))  fixport="0";						  // 0,1 값을 넣어줌 	
		query.append(fixport+",															\n");
		query.append("		:host_id,													\n");
		query.append("			'U'			)											\n");
		

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		count = queryRunner.update(conn);	//Update처리 Methode
		System.out.println("UpPos count:  "+count);
		
		//reg_data
		
		return rsTray;
}
//====================================================================================
//							service_id != pre_svc일경우 삭제 
//====================================================================================
	public ResultSetTray  TBL_UserSystemDel  (Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		
		// 공통 값 
		String KIND   	= 	reqTray.getString("kind");			 // 사용자 종류 
		String name   	= 	reqTray.getString("name");			 // 사용자 이름
		String userid 	=	reqTray.getString("userid"); 		 // 사용자 아이디
		
		String service_id 	= reqTray.get("service_id");
		String pre_svc 		= reqTray.get("pre_svc");
		
		query=new StringBuffer();

			query.append("	DELETE FROM 								\n");
			query.append("		TBL_USER_SYSTEM 						\n");
			query.append("			WHERE SERVICE_ID =:pre_svc 			\n");
			query.append("				AND SYSTEM_ID=:system_id		\n");
			
			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			count = queryRunner.update(conn);	//Update처리 Methode
			System.out.println("UpPos count:  "+count);
		
		//reg_data
		
		return rsTray;
	}
}
