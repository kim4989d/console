//=================================================================================
//								��� ���/����   ������ 
//=================================================================================
window.document.onload = document.form.system_id.focus();

function Form_check()
{
	var id_pattern = new RegExp('[^a-zA-Z0-9_]'); //���̵� ���ϰ˻� ���Խ�
	var temp=document.form;
	if (!temp.system_id.value.length || id_pattern.test(temp.system_id.value))
	 {
    	 alert("����ID�� �����ڿ� ����, '_' �� �Է��� �ּ���.");
		 temp.system_id.value = "";
		 temp.system_id.focus();
		 return;
	 }
	else if(getByte(temp.system_id.value)>20)
	{
		alert("���ID 20byte\n���� �������ϴ�.");
		form.system_id.focus();
		return;
	}
	var temp=document.form.system_name.value
	if(temp=="")
	{
		alert("�ý����̸��� �Է��ϼ���!");
		form.system_name.focus();
		return;
	}
	if(getByte(temp)>20)
	{
		alert("�ý����̸��� 20byte\n���� �� �����ϴ�.");
		form.system_name.focus();
		return;
	}

	var port_no=document.form.port_no;
	var win_port=document.form.win_port;
	
	if (document.form.os_type[0].checked == true)
	{
		var temp=document.form;
		if (temp.ip_addr1.value =="" || temp.ip_addr2.value=="" || temp.ip_addr3.value=="" || temp.ip_addr4.value=="")
		{
			alert("IP �ּҴ� ��Ȯ�� �Է� ���ּ���!");
			form.ip_addr1.focus();
			return;
		}
		if (!port_no.value)
		{
			alert("��Ʈ��ȣ�� �Է� ���ּ���!");
			form.port_no.focus();
			return;
		}
	}
	else
	{
		var temp=document.form;
		if (temp.wip_addr1.value =="" || temp.wip_addr2.value=="" || temp.wip_addr3.value=="" || temp.wip_addr4.value=="")
		{
			alert("IP �ּҴ� ��Ȯ�� �Է� ���ּ���!");
			form.wip_addr1.focus();
			return;
		}
		if (!win_port.value)
		{
			alert("��Ʈ��ȣ�� �Է� ���ּ���!");
			form.win_port.focus();
			return;
		}

	}

	var temp=document.form.service_id.value;
	if (temp=="")
	{
		alert("���񽺸� �����ϼ���!");
		form.service_id.focus();
		return;
	}

	var temp=document.form.oper_id.value;
	if (temp=="")
	{
		alert("����ڸ� �����ϼ���!");
		form.oper_id.focus();
		return;
	}
	var temp=document.form.kom.value;
	if(getByte(temp)>20)
	{
		alert("������ 20byte\n���� �� �����ϴ�.");
		form.kom.focus();
		return;
	}
	var temp=document.form.sang_pos.value;
	if(getByte(temp)>20)
	{
		alert("������ 20byte\n���� �� �����ϴ�.");
		form.sang_pos.focus();
		return;
	}	
	form.submit();
	return;
}


function getByte(s)
{
    var sum = 0;
    var len = s.length;
    for (var i=0; i<len; i++) {
        var ch = s.substring(i, i + 1);
        var en = escape(ch);
        if ( en.length <= 4 ) {
            sum++;
        }
        else {
            sum += 2;
        }
    }
    return sum;
}


function onlyNumber()
{
	if ( event.keyCode<48 || event.keyCode>57 )
		{
			event.returnValue = false;
		}
}

function Form_check2()
{

	var id_pattern = new RegExp('[^a-zA-Z0-9_]'); //���̵� ���ϰ˻� ���Խ�
	var temp=document.form;
	if (!temp.host_id.value.length || id_pattern.test(temp.host_id.value))
	 {
    	 alert("����ID�� �����ڿ� ����, '_' �� �Է��� �ּ���.");
		 temp.host_id.value = "";
		 temp.host_id.focus();
		 return;
	 }
	else if(getByte(temp.host_id.value)>20)
	{
		alert("���ID 20byte\n���� �������ϴ�.");
		form.host_id.focus();
		return;
	}
	var temp=document.form.system_name.value
	if(temp=="")
	{
		alert("�ý����̸��� �Է��ϼ���!");
		form.system_name.focus();
		return;
	}
	if(getByte(temp)>20)
	{
		alert("�ý����̸��� 20byte\n���� �� �����ϴ�.");
		form.system_name.focus();
		return;
	}

	var port_no=document.form.port_no;
	var win_port=document.form.win_port;
	
	if (document.form.os_type[0].checked == true)
	{
		var temp=document.form;
		if (temp.ip_addr1.value =="" || temp.ip_addr2.value=="" || temp.ip_addr3.value=="" || temp.ip_addr4.value=="")
		{
			alert("IP �ּҴ� ��Ȯ�� �Է� ���ּ���!");
			form.ip_addr1.focus();
			return;
		}
		if (!port_no.value)
		{
			alert("��Ʈ��ȣ�� �Է� ���ּ���!");
			form.port_no.focus();
			return;
		}
	}
	else
	{
		var temp=document.form;
		if (temp.wip_addr1.value =="" || temp.wip_addr2.value=="" || temp.wip_addr3.value=="" || temp.wip_addr4.value=="")
		{
			alert("IP �ּҴ� ��Ȯ�� �Է� ���ּ���!");
			form.wip_addr1.focus();
			return;
		}
		if (!win_port.value)
		{
			alert("��Ʈ��ȣ�� �Է� ���ּ���!");
			form.win_port.focus();
			return;
		}

	}

	var temp=document.form.service_id.value;
	if (temp=="")
	{
		alert("���񽺸� �����ϼ���!");
		form.service_id.focus();
		return;
	}

	var temp=document.form.oper_id.value;
	if (temp=="")
	{
		alert("����ڸ� �����ϼ���!");
		form.oper_id.focus();
		return;
	}
	var temp=document.form.kom.value;
	if(getByte(temp)>20)
	{
		alert("������ 20byte\n���� �� �����ϴ�.");
		form.kom.focus();
		return;
	}
	var temp=document.form.sang_pos.value;
	if(getByte(temp)>20)
	{
		alert("������ 20byte\n���� �� �����ϴ�.");
		form.sang_pos.focus();
		return;
	}	
	form.submit();
	return;
}

function CheckEnt(next) {
	if (event.keyCode == 13)
	{
		next.focus();
		return			
	}
}


 function clickshow(num)   
        {   
             if (num==1)
              {   
                menu=eval("document.all.block"+num+".style");           
                menu1=eval("document.all.block"+2+".style");  
                                 				                                             
			   if (menu.display=="none")   
				{
					menu.display="block";   
					menu1.display="none";   
				}  
			  } 
			else if (num==2)
              {   
                menu=eval("document.all.block"+num+".style");           
                menu1=eval("document.all.block"+1+".style");
			   if (menu.display=="none")   
				{
					menu.display="block";
					menu1.display="none";
					  		  	    
				}
				
			  } 

		}
function CheckEnt(next) {
	if (event.keyCode == 13)
	{
		next.focus();
		return			
	}
}

function fix(){
	var port=document.form.port_no.value;
		if(port==23){
			alert("PORT�� 23�ϰ��� ������Ʈ ����� �Ұ��� �մϴ�.")
			form.fixport.checked = false;
		}
	}
//���� 
