package console.common.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;

public class BaseDao {

	public int flagupdate=0;
	
	
	/**
	 * 
	 * 
	 * 작성자: 김현호
	 * 내용:다중 업데이트나 insert ,delete 에대한 flag 처
	 * 
	 * 
	 * 
	 * @param flagupdate
	 * @return
	 */
	
	public void  setFlagUpdate(int flagupdate){
		
		this.flagupdate=flagupdate;
		
	
	
	}
	
	
	public int getFlagUpdate(){
	return this.flagupdate;
	
	}
	
	
	
	
	
	
	
	
	
	public ResultSetTray CheckBoxList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;

		query=new StringBuffer();
		query.append(" select               \n");
		query.append(" 	(                	\n");   
		query.append(" 	select           	\n");   
		query.append(" 		count(*) 	\n");   
		query.append(" 	from tbl_checkbox	\n");   
		query.append(" 	)                	\n");   
		query.append(" 	option_count     	\n");   
		query.append(" 	,option_userid  	\n");    
		query.append(" 	,option_name     	\n");   
		query.append(" from tbl_checkbox           \n");
		query.append(" group by option_userid      \n");

		
		
		queryRunner =new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}	

	
//	=======================================================================================
// 	명   칭 	 :   작업 관리 
// 	작성자        :   최승주 		
//	날    짜        :   09-02-06 		
//	수정 날짜   :
//=======================================================================================
	
	
	public ResultSetTray WorkCheckBoxList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;

		query=new StringBuffer();
		query.append(" select                      		\n");
		query.append(" 	optuser_key  					\n");    
		query.append(" 	,optsystem_key     			  	\n");   
		query.append(" from tbl_checkbox          	 	\n");
		
		
		queryRunner =new QueryRunner("BaseDao WorkCheckBoxList(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}	
	
//=======================================================================================
// 	명   칭 	 :   시스템  장비 검색 
// 	작성자        :   김명진 		
//	날    짜        :   09-01-21 		
//	수정 날짜   :
//=======================================================================================
	public ResultSetTray ServerCheckBoxList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		
		query=new StringBuffer();
		query.append(" 	select           	\n");   
		query.append(" 	optuser_key,  		\n");    
		query.append(" 	optsystem_key     	\n"); 
		query.append(" 	from tbl_checkbox	\n");   
	
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}
	
	
	public String Qutter(String token){
			token="'"+token+"'";
	return 	token.trim();
	}
	
	
	
	
	protected void close(ResultSet resultSet) {
        if (resultSet != null) {
            try {
            	resultSet.close();
            } catch (SQLException ex) {
            }
        }
    }

    protected void close(Statement statement) {
        if (statement != null) {
            try {
            	statement.close();
            } catch (SQLException ex) {
            }
        }
    }

    protected void close(Statement statement, ResultSet resultSet) {
        close(resultSet);
        close(statement);
    }

    protected void close(ResultSet resultSet, Statement statement) {
        close(statement, resultSet);
    }
}
