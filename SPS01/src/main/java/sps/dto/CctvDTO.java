package sps.dto;

import sps.dao.*;
import sps.vo.*;

public class CctvDTO extends DBManager
{

	
	public boolean Insert(CctvVO vo)
	{
		this.DBOpen();
		
		String sql = "";
		sql += "insert into parkingcardetect (cctv, totalspace) ";
		sql += "values (";
		sql += "'" + vo.getCctv() + "', ";
		sql += "'" + vo.getTotalspace() + "'";
		sql += ")";
		this.RunCommand(sql);
		
		sql = "select last_insert_id() as managecctv ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setManagecctv(this.GetValue("managecctv"));
		
		this.DBClose();
		return true;
	}
	
	public CctvVO read(String managecctv)
	{
		String sql = "";
		
		this.DBOpen();
		
		sql  = "select * ";
		sql	+= "from parkingcardetect ";
		sql += "where managecctv = " + managecctv;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		CctvVO vo = new CctvVO();
		vo.setManagecctv(managecctv);
		vo.setCctv(this.GetValue("cctv"));
		vo.setTotalspace(this.GetValue("totalspace"));
		vo.setTotalcar(this.GetValue("totalcar"));
		
		this.DBClose();
		return vo;
	}	
	

}
