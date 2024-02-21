package sps.dto;

import sps.vo.TestVO;
import sps.dao.*;

public class TestDTO extends DBManager
{	
	public boolean Insert(TestVO vo)
	{
		this.DBOpen();
		
		String sql = "";

		sql += "insert into test (no, image, phyimage) ";
		sql += "values (";
		sql += "'" + _R(vo.getNo())          + "',";
		sql += "'" + _R(vo.getImage())       + "',";
		sql += "'" + _R(vo.getPhyimage())    + "'";
		sql += ")";
		this.RunCommand(sql);
		
		sql = "select last_insert_id() as no ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setNo(this.GetValue("no"));
		
		this.DBClose();
		return true;
	}
	
	public boolean Update(TestVO vo)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "update test set ";
		if(!vo.getImage().equals(""))
		{
			sql += "image='" + _R(vo.getImage()) + "',";
			sql += "phyimage='" + _R(vo.getPhyimage()) + "'";
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

		sql  = "select * from test ";
		sql += "where no = " + no;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		TestVO vo = new TestVO();
		vo.setNo(no);
		vo.setImage(this.GetValue("image"));
		vo.setPhyimage(this.GetValue("phyimage"));
		vo.setId(this.GetValue("id"));
	
		this.DBClose();
		return vo;
	}	
	
}
