function test(){

alert('tttttttttttttt jjjjjjjjjj');

}



/***************************************************************
	���: üũ�ڽ� ��ü ���� ���
	�ۼ���: ���漷	
	�ۼ���: 2009-01-21
****************************************************************/
function checkBox_AllCheck(){
	var frm = document.form;			//�ش� ������ name Ȯ��.	
	var temp = "";
	var allcheck = frm.allcheckbox;		//��ü������ Ŭ����  checkbox name Ȯ��.
	
	temp = frm.check;					//üũ�� checkbox nameȮ��
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
