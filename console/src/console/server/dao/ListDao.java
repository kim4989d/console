//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��    : �ý��� ��� ���� ��ü DB
//Ư��  ����  :  
//��	 ��  ��   : �� �� �� 
//��         ¥  : 2009-02-06
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
//						��ü ���ڵ�� ���ϱ� (�����ٿ�)
//=======================================================================================
	public ResultSetTray EquipmentCount(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;

		query=new StringBuffer();
		
		query.append("		SELECT system_id FROM TBL_SYSTEM					\n"); //��ü ���ڵ�� 

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}
//	=====================================================================================
//						��ü ���ڵ�� ���ϱ� (�����ٿ�)
//	=====================================================================================
		public ResultSetTray exceldown(Connection conn,Tray reqTray){
			 
			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			String STR_AND = "";
			query=new StringBuffer();
			
			//���� �� �� 
//			userid :web21 name:������ kindO
//			userid :web21 name:������ kindO
//			userid :web21 name:������ kindO		
			String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
			String name   	= 	reqTray.getString("name");			 // ����� �̸�
			String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 
			
			KIND = "A";												 // �ӽ� ����� ���� ��
			
			String div 			= reqTray.get("div");     // left �޴���  
			
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
//						��� ��� �ҷ� ����  (���� ��� ��� ��Ȳ_��� ����  )
//=========================================================================================
	public ResultSetTray EquipmentList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		//���� �� �� 
//		userid :web21 name:������ kindO
//		userid :web21 name:������ kindO
//		userid :web21 name:������ kindO
		
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 
		
		 // �ӽ� ����� ���� �� 
		//KIND = "A";														
		//KIND = "O";
		//KIND = "M";
		
		//userid = "web21";
		
		String div = reqTray.getString("div");
		if (div.equals("") || div == ""){div ="ALL";}
		
		String key = reqTray.getString("key"); 				 //key ��
		

		//String KIND = "A";								 //�ӽ÷� ������ ���̵� �ο� 
		
		String str_order = reqTray.getString("o"); 			 //type
		String str_value = reqTray.getString("s"); 			 //type
		//String SID = reqTray.getString("SID");			 //���ǰ� (ID)
		//String SID = "ngsadmin";                             //�ӽ÷� �Ƶ� �ο� 

		if (str_value.equals(""))  str_value="0";				
		if (str_order.equals(""))  str_order= "system_id";			
		if (str_value.equals("1")) str_order = str_order + "  desc";		

		
		query=new StringBuffer();
		
		String STR_AND = "";
		if(!div.equals("") && !div.equals("ALL")) { 
			STR_AND=" and  upper(a.service_id)=upper('"+div+"')";   // left �޴�  �� 
		}
	 
		
		if (KIND.equals("A") || KIND.equals("O")){   							// ������ �� ����� (�Ŵ���)
			System.out.println("������ �� ����� ");
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
		}else if (KIND.equals("M") || KIND.equals("G")){ 			 			// �Ϲ� ����� 
			System.out.println("�Ϲ� �����  ");
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
			String value = reqTray.getString("txtsearch"); //txtsearch �˻� �� 
			System.out.println(value+"========================");
																	 // like �Լ� ǥ�� ���(������ ��� �˻������� �̷��� �����Ǿ� ����
			if(reqTray.getString("selectoption").equals("SYSTEMID")){query.append("  AND a.host_id like "); //like �Լ� ǥ�� ���(������ ��� �˻������� �̷��� �����Ǿ� ����
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
//					��� ��� �ҷ� ����  (���� ����  ��� ��Ȳ   )
//===========================================================================
public ResultSetTray EquipmentListDel(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		//���� �� �� 
//		userid :web21 name:������ kindO
//		userid :web21 name:������ kindO
//		userid :web21 name:������ kindO
		
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 

//		KIND = "A";												 // �ӽ� ����� ���� ��
		
		String div = reqTray.getString("div");
		if (div == "" || div.equals("")) div ="ALL";
		
		String key = reqTray.getString("key"); 				 //key ��

		String str_order = "";
		String str_value = "";
//		String SID = "";
		str_order =reqTray.getString("o"); 					//type
		str_value = reqTray.getString("s"); 				//type
//		SID = reqTray.getString("SID");						//���ǰ� (ID)
//		SID = "CONSOLE";									//�ӽ÷� ID �� �ο� 
		
		if (str_value.equals(""))	 str_value="0";				
		if (str_order.equals("")) 	 str_order="  system_id";			
		if (str_value.equals("1"))   str_order = str_order+"  desc";		
		
		
		query=new StringBuffer();
		String STR_AND = "";
		if (!div.equals("") && !div.equals("ALL")) { 
			STR_AND=" and  upper(a.service_id)=upper('"+div+"')";   // left �޴�  �� 								
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
		if(reqTray.getString("selectoption").equals("SYSTEMID")){query.append("  AND a.host_id like "); //like �Լ� ǥ�� ���(������ ��� �˻������� �̷��� �����Ǿ� ����
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
//								���� ��� ��� ��Ȳ_����(TBL_SYSTEM)
//=========================================================================================	
	public ResultSetTray EquipmentListDelOk(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		int count   	= 0;
		
		// ���� �� 
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 
		
			query = new StringBuffer();
		// KIND = reqTray.get("kind");   						// ���� ����� �� �޾� ���� 
			
					
			query.append("	delete from TBL_SYSTEM where system_id =:system_id		\n");
			if( KIND.equals("O")) {
				query.append("	 and charger_id='"+userid+"'							\n");
					}

			 queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			 count = queryRunner.update(conn);					//Updateó�� Methode
			 System.out.println("UpPos count:  "+count);

//		reg_data

		return rsTray;
		}
//=========================================================================================
//						���� ��� ��� ��Ȳ_����(TBL_USER_SYSTEM)
//=========================================================================================	
public ResultSetTray EquipmentListDelOk2(Connection conn,Tray reqTray){

			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			
			int count 		= 0;
			
			// ���� �� 
			String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
			String name   	= 	reqTray.getString("name");			 // ����� �̸�
			String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 
			
			query = new StringBuffer();
			KIND = reqTray.get("kind");
			

			
			query.append("	delete from TBL_USER_SYSTEM where system_id=:system_id		\n");
			
			 queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			 count = queryRunner.update(conn);	//Updateó�� Methode
			 System.out.println("UpPos count:  "+count);

//reg_data

return rsTray;
}
//=========================================================================================
//						���� ��� ��� ��Ȳ_���� �� TBL_SYSTEM_HISTORY �� ���� 
//=========================================================================================
	public ResultSetTray EquipmentListDel(Connection conn,Tray reqTray, Tray rsTray_H){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		
		int count 			= 0;
		int port  			= 0;
		int bun_no			= 0;
		
		// ���� �� 
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 


		System.out.println("===================================================");
		System.out.println(rsTray_H);
		System.out.println("===================================================");
		query = new StringBuffer();
		
			
		//�ش� STRING �� integer���� ��ȯ�� DB ����
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
		// ���� ����Ÿ ���� �κ� values(==>
		query.append(":system_id,													\n"); 
		query.append("		:service_id ,											\n");
		query.append("			:system_name,										\n");
		query.append("				:system_ip,										\n");
		query.append(port);    										//integer ������ ��ȯ�� port�� �޾ƿ� 
		//bu.append("					:port,									\n");
		query.append("					,	:charger_id,							\n");
		query.append("							:vendor_id,							\n");
		query.append(" 	:kom,														\n");
		query.append("			:sang_pos,											\n");
		query.append(bun_no);										//integer ������ ��ȯ��bun_no�� �޾ƿ�				
		//bu.append("				:bun_no,										\n");
		query.append("					,:ostype,									\n"); 
		query.append("						now(),									\n");
		query.append("							'"+userid+"',							\n");
		query.append("								:host_id,						\n"); 
		query.append("				'D'                      )                 		\n");

		 queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		 count = queryRunner.update(conn);	//Updateó�� Methode
		 System.out.println("UpPos count:  "+count);

//reg_data

return rsTray;
}

//=========================================================================================
//				      ���� �ϱ��� SYSTEM_HISTORY�� ������ ������ ���Ͽ� ���� �޾ƿ�  
//=========================================================================================
	public ResultSetTray EquipmentListDelInsert(Connection conn,Tray reqTray){
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query    	   = null;
		
		// ���� �� 
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 

		
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
//								��Ʈ ��ȣ �ҷ� ���� 
//====================================================================================
	public ResultSetTray ListReq(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;

		query=new StringBuffer();
		
		// ���� �� 
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 

		
		System.out.println("��Ʈ��ȣ ");
		query.append("select seqno from TBL_PORT_LIST order by seqno  \n"); 
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}

//======================================================================
//							�Ҽ� ���� �о� ���� 
//======================================================================	
	public ResultSetTray ListReq2(Connection conn,Tray reqTray){  
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		int count			=	0;
		int temp			=	2;
		
		// ���� �� 
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 

		query=new StringBuffer();
		
//		SID = reqTray.getString("SID");
//		SID = "ngsadmin";						 //�ӽ� �Ƶ� �ο� 
		
		System.out.println("�Ҽ� ���� ");
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
//								����� ����Ÿ �ҷ���  
//======================================================================
	public ResultSetTray ListReq3(Connection conn,Tray reqTray){ 
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		int count	= 0;
		int temp	= 2;
		
		// ���� �� 
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 
		
		query=new StringBuffer();
		
		System.out.println("����� ");
		query.append("select user_id,name from TBL_USER    				 	\n");
		query.append("where admit_flag='1' and kind ='O' order by name desc \n");  
		
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}
//======================================================================
//							������ ����Ÿ �ҷ��� 
//======================================================================
	public ResultSetTray ListReq4(Connection conn,Tray reqTray){ 
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		int count	= 0;
		int temp	= 2;
		
		// ���� �� 
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 
		
		query=new StringBuffer();
		
		System.out.println("������");
		query.append("select vendor_id,vendor_name    						\n"); 
		query.append("from TBL_VENDOR  order by vendor_name desc 			\n");  

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}
	
//======================================================================
//							TBL_SYSTEM ���� �� 
//======================================================================
	public ResultSetTray ServerReqOk(Connection conn, Tray reqTray){ 
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;

		query=new StringBuffer();
		
		// ���� �� 
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 
		
		System.out.println("TBL_SYSTEM ���� �� ����");
		
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
//						service_id, charger_id �� �ߺ� Ȯ��  
//======================================================================
public ResultSetTray ServerReqOk2(Connection conn, Tray reqTray){
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		
		// ���� �� 
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 
		
		System.out.println("service_id , charger_id ���� �� ����");
		
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
//					OS_TYPE=="W" �̸� �� ������ ���� (��Ʈ ��ȣ ���ϱ�)
//======================================================================
public ResultSetTray ServerReqOk3(Connection conn, Tray reqTray){ 
	
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	
	query=new StringBuffer();
	
	// ���� �� 
	String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
	String name   	= 	reqTray.getString("name");			 // ����� �̸�
	String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 
	
	System.out.println("PORT ���� SELECT");
	
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
//								�ý��� ��� �ϱ� 
//====================================================================== 
public ResultSetTray ServerReqOk4(Connection conn, Tray reqTray, int port){ 
	
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	int count = 0;
	
	// ���� �� 
	String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
	String name   	= 	reqTray.getString("name");			 // ����� �̸�
	String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵� 
	
	String ip_addr = (reqTray.get("ip_addr1")+".")+(reqTray.get("ip_addr2")+".") //IP ����ȭ
						+(reqTray.get("ip_addr3")+".")+(reqTray.get("ip_addr4"));
	
	System.out.println("======================");
	System.out.println(ip_addr);
	
	
	String wip_addr = (reqTray.get("wip_addr1")+".")+(reqTray.get("wip_addr2")+".") //IP ����ȭ 
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
							 //���� ����Ÿ ���� 
	query.append("			:system_id, :service_id, :system_name,			\n");
	
	if(reqTray.get("os_type").equals("U") || reqTray.get("os_type")=="U") {
		query.append("'"+ip_addr+"'											\n");
	query.append("			,:port_no,										\n");
	}else{
		query.append("'"+wip_addr+"'										\n");
	query.append(","+port+","); //PORT ���� �ҷ���
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
	 count = queryRunner.update(conn);	//Updateó�� Methode
	 System.out.println("UpPos count:  "+count);
	
	//reg_data
	
return rsTray;
}
//======================================================================
//							�ý��� HISTORY ��� �ϱ� 
//======================================================================
public ResultSetTray ServerReqOk5(Connection conn, Tray reqTray, int port){ 
	
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	int count = 0;

	// ���� �� 
	String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
	String name   	= 	reqTray.getString("name");			 // ����� �̸�
	String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵�
	//SID = reqTray.getString("SID");
	
	//================================================================================
	//IP ����ȭ(UNIX)
	String ip_addr = (reqTray.get("ip_addr1")+".")+(reqTray.get("ip_addr2")+".") 
						+(reqTray.get("ip_addr3")+".")+(reqTray.get("ip_addr4"));
	
	System.out.println("======================");
	System.out.println(ip_addr);
	
	 //IP ����ȭ (WINDOW)
	String wip_addr = (reqTray.get("wip_addr1")+".")+(reqTray.get("wip_addr2")+".")
						+(reqTray.get("wip_addr3")+".")+(reqTray.get("wip_addr4"));
	
	System.out.println("======================");
	System.out.println(wip_addr);

	
	
	// ����Ÿ�� �񱳰� 

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
	//======================OS_TYPE�� ��Ʈ ��ȣ  =========================================
	if(reqTray.get("os_type").equals("U")) {
	query.append("'"+ip_addr+"'											\n");
	query.append("			,:port_no,									\n");
	}else{
	query.append("'"+wip_addr+"'										\n");
	query.append(","+port+","); //PORT ���� �ҷ��� 
	}	
	//====================���ǹ� �� ===================================================
	query.append("		'',:oper_id,:vendor_id,							\n");
	query.append("			:kom,:sang_pos,:bun_no,:os_type,NOW(),		\n");
	query.append("			'"+userid+"',									\n"); //�ӽ� ���̵� ���� �־��� 
	 if (reqTray.get("fixport").equals("") || reqTray.get("os_type").equals("W") || reqTray.get("os_type").equals(null)) {			
		 query.append("0,:system_id,'I'			)						\n");
	 }else{
		 query.append(":fixport,:system_id,'I'	) 						\n");
	 }
	 
	 
	 queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
	 count = queryRunner.update(conn);	//Updateó�� Methode
	 System.out.println("UpPos count:  "+count);
	
	//reg_data
	
return rsTray;
}
//====================================================================================
//									������ ���  �ҷ�����  
//====================================================================================
public ResultSetTray  ListEdit(Connection conn,Tray reqTray){
	 
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;

	query=new StringBuffer();
	
	// ���� �� 
	String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
	String name   	= 	reqTray.getString("name");			 // ����� �̸�
	String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵�
	
	System.out.println("���� ��� �ҷ� ����  ");
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
//								������ PORT �ҷ�����  
//====================================================================================
public ResultSetTray  ListEditPort(Connection conn,Tray reqTray, String NT_port){
	 
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;

	query=new StringBuffer();
	int port = 0;
	
	// ���� �� 
	String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
	String name   	= 	reqTray.getString("name");			 // ����� �̸�
	String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵�
	
	port = Integer.parseInt(NT_port);		//��Ʈ ��ȣ INTEGER �� ���� �ϱ� 
	
	query.append("	SELECT SEQNO FROM TBL_PORT_LIST WHERE PORT="+port);
	
	queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
	rsTray = (ResultSetTray)queryRunner.query(conn);
	
	//reg_data
	
return rsTray;
	}
//====================================================================================
//								������ SeqNo �ҷ�����  
//====================================================================================
public ResultSetTray  ListEditSeqNo (Connection conn,Tray reqTray){
	 
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;

	query=new StringBuffer();
	
	// ���� �� 
	String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
	String name   	= 	reqTray.getString("name");			 // ����� �̸�
	String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵�
	
	query.append("select ifnull(max(SEQNO),0)+1 from TBL_PORT_WORK");
	
	queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
	rsTray = (ResultSetTray)queryRunner.query(conn);
	
	//reg_data
	
return rsTray;
	}
//====================================================================================
//					os_type �� NT(W)�� ��� ������ PORT , OLD_PORT ���ϱ� 
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
//								����(PORT_UPDATE)������Ʈ �ϱ� 
//====================================================================================
	public ResultSetTray  ListEditSeqPortUp (Connection conn,Tray reqTray ,int seqNo, Tray rsTray2 ){
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		
		query=new StringBuffer();
		
		// ���� �� 
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵�
		
		String os_type = reqTray.getString("os_type");
		String temp_type = reqTray.getString("temp_type");
		int win_port = reqTray.getInt("win_port");
		int temp_port = reqTray.getInt("temp_port");
		
		//IP ����ȭ (WINDOW)
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
		count = queryRunner.update(conn);	//Updateó�� Methode
		System.out.println("UpPos count:  "+count);
		}
		//reg_data
		
		return rsTray;
	}
//====================================================================================
//					TEMP_TYPE ��UNIX(U) �� ��� ������  PORT , OLD_PORT ���ϱ� 
//====================================================================================
	public ResultSetTray  ListEditSeqPortU (Connection conn,Tray reqTray){
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		
		// ���� �� 
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵�
		
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
		
		// ���� �� 
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵�
		//String SID = "ngsadmin"; //�ӽ� ���̵� ��
		//SID = reqTray.getString("SID");
		
		query=new StringBuffer();
		String os_type 		= reqTray.getString("os_type");
		String temp_type 	= reqTray.getString("temp_type");
		String fixport 		= reqTray.getString("fixport");
		
	//IP ����ȭ(UNIX)
		String ip_addr = (reqTray.get("ip_addr1")+".")+(reqTray.get("ip_addr2")+".") 
							+(reqTray.get("ip_addr3")+".")+(reqTray.get("ip_addr4"));
		System.out.println("======================");
		System.out.println(ip_addr);
			
	//IP ����ȭ (WINDOW)
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
		count = queryRunner.update(conn);	//Updateó�� Methode
		System.out.println("UpPos count:  "+count);
		
		//reg_data
		
		return rsTray;
}
//====================================================================================
//							TBL_SYSTEM_HISTORY ����  
//====================================================================================
	public ResultSetTray  TblSystem_History_In  (Connection conn,Tray reqTray, int new_port){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		String SID = "ngsadmin"; //�ӽ� ���̵� ��
		//SID = reqTray.getString("SID");
		
		query=new StringBuffer();
		String os_type 		= reqTray.getString("os_type");
		String temp_type 	= reqTray.getString("temp_type");
		String fixport 		= reqTray.getString("fixport");
		
		//================================================================================
		//IP ����ȭ(UNIX)
		String ip_addr = (reqTray.get("ip_addr1")+".")+(reqTray.get("ip_addr2")+".") 
			+(reqTray.get("ip_addr3")+".")+(reqTray.get("ip_addr4"));
		
		System.out.println("======================");
		System.out.println(ip_addr);
		
		//IP ����ȭ (WINDOW)
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
																							  //os_type ���� ip �־� �ֱ� 
		if 	(os_type.equals("U")){															  //UNIX �� ��� 
		query.append("'"+ip_addr+"',													\n");
		query.append("		:port_no,													\n");
		}else{							//NT �� ��� 
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
		query.append("'"+SID+"',														\n"); //�ӽ� ���̵�  �� 
		query.append("				fixedflag=											\n");
		if (fixport.equals("") || os_type.equals("W"))  fixport="0";						  // 0,1 ���� �־��� 	
		query.append(fixport+",															\n");
		query.append("		:host_id,													\n");
		query.append("			'U'			)											\n");
		

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		count = queryRunner.update(conn);	//Updateó�� Methode
		System.out.println("UpPos count:  "+count);
		
		//reg_data
		
		return rsTray;
}
//====================================================================================
//							service_id != pre_svc�ϰ�� ���� 
//====================================================================================
	public ResultSetTray  TBL_UserSystemDel  (Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		
		// ���� �� 
		String KIND   	= 	reqTray.getString("kind");			 // ����� ���� 
		String name   	= 	reqTray.getString("name");			 // ����� �̸�
		String userid 	=	reqTray.getString("userid"); 		 // ����� ���̵�
		
		String service_id 	= reqTray.get("service_id");
		String pre_svc 		= reqTray.get("pre_svc");
		
		query=new StringBuffer();

			query.append("	DELETE FROM 								\n");
			query.append("		TBL_USER_SYSTEM 						\n");
			query.append("			WHERE SERVICE_ID =:pre_svc 			\n");
			query.append("				AND SYSTEM_ID=:system_id		\n");
			
			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			count = queryRunner.update(conn);	//Updateó�� Methode
			System.out.println("UpPos count:  "+count);
		
		//reg_data
		
		return rsTray;
	}
}
