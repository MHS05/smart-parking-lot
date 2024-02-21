package sps.dto;

import sps.vo.TestVO;
import sps.dao.*;

public class TestDTO extends DBManager
{	
	public boolean Insert(TestVO vo)
	{
		this.DBOpen();
		
		String sql = "";

		sql += "insert into carinfo (enterpic) ";
		sql += "values (";
		sql += "'" + _R(vo.getEnterpic())       + "'";
		sql += ")";
		this.RunCommand(sql);
		
		sql = "select last_insert_id() as cmno ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setNo(this.GetValue("cmno"));
		
		this.DBClose();
		return true;
	}
	
	public boolean Update(TestVO vo)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "update test set ";
		if(!vo.getEnterpic().equals(""))
		{
			sql += "enterpic='" + _R(vo.getEnterpic()) + "'";
		}
		sql += "where no = " + vo.getNo();
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}	
	
	
	public boolean Delete(String no)
	{
		this.DBOpen();
		
		String sql = "";

		sql = "delete from test where no = " + no;
		this.RunCommand(sql);
		
		this.DBClose();
		
		return true;
	}
	
	public TestVO Read(String no)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select * from carinfo ";
		sql += "where cmno = " + no;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		TestVO vo = new TestVO();
		vo.setNo(no);
		vo.setEnterpic(this.GetValue("enterpic"));
		vo.setId(this.GetValue("id"));
	
		this.DBClose();
		return vo;
	}	
	
}
