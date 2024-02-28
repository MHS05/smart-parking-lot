package sps.dto;

import sps.dao.*;
import sps.vo.*;

public class AdminDTO extends DBManager
{	
	//회원가입 처리
	public boolean Join(AdminVO vo)
	{
		
		this.DBOpen();
			
		//관리자 정보를 Insert 한다.
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
	
	//관리자 로그인 처리
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
			//해당 회원 정보가 없음.
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
