package sps.dto;

import sps.dao.*;
import sps.vo.*;

public class AdminDTO extends DBManager
{	
	//ȸ������ ó��
	public boolean Join(AdminVO vo)
	{
		
		this.DBOpen();
			
		//������ ������ Insert �Ѵ�.
		String sql = "";
		sql  = "insert into admin (id,pw) ";
		sql += "values (";
		sql += "'" + _R(vo.getId()) + "',";
		sql += "md5('" + _R(vo.getPw()) + "'),";
		sql += ") ";
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}
	
	//������ �α��� ó��
	public AdminVO Login(String id,String pw)
	{
		String sql = "";
		this.DBOpen();
		sql  = "select ano,id,pw ";
		sql += "from admin ";
		sql += "where id = '" + _R(id) + "' and pw = md5('" + _R(pw) + "') ";
		this.RunSelect(sql);
		if(this.GetNext() == false)
		{
			//�ش� ȸ�� ������ ����.
			this.DBClose();
			return null;
		}
		AdminVO vo = new AdminVO();
		vo.setId(id);
		vo.setPw(this.GetValue("pw"));
		this.DBClose();
		return vo;
	}
}
