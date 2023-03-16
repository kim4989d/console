function test(){

alert('tttttttttttttt jjjjjjjjjj');

}



/***************************************************************
	기능: 체크박스 전체 선택 기능
	작성자: 이충섭	
	작성일: 2009-01-21
****************************************************************/
function checkBox_AllCheck(){
	var frm = document.form;			//해당 페이지 name 확인.	
	var temp = "";
	var allcheck = frm.allcheckbox;		//전체선택을 클릭할  checkbox name 확인.
	
	temp = frm.check;					//체크될 checkbox name확인
	var len = temp.length;
	
	if(allcheck.checked){
		for( var j=0; j < temp.length ; j++){
			temp[j].checked = true;
		}
	}else{
		
		for( var j=0; j < temp.length ; j++){
			temp[j].checked = false;
		}  
	}
}
/**************************************************************/
