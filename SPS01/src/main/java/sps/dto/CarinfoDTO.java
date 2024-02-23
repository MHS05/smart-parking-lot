package sps.dto;

import sps.dao.*;
import sps.vo.*;

public class CarinfoDTO extends DBManager
{	
	public boolean Insert(CarinfoVO vo)
	{
		this.DBOpen();
		
		String sql = "";

		sql += "insert into carinfo (enterpic, exitpic)";
		sql += "values (";
		sql += "'" + vo.getEnterpic() + "', ";
		sql += "'" + vo.getExitpic() + "'";
		sql += ")";
		this.RunCommand(sql);
		
		sql = "select last_insert_id() as cmno ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setCmno(this.GetValue("cmno"));
		
		this.DBClose();
		return true;
	}
	
	public boolean Update(CarinfoVO vo)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "update sps set ";
		sql += "carnum=" 		+ vo.getCarnum()      	  + "',";
		sql += "entertime="	    + vo.getEntertime()       + "',";
		sql += "exittime=" 		+ vo.getExittime()     	  + "',";
		sql += "timecal=" 		+ vo.getTimecal()     	  + "',";
		sql += "enterpic=" 		+ vo.getEnterpic()   	  + "',";
		sql += "exitpic=" 		+ vo.getExitpic()         + "',";
		sql += "paymethod=" 	+ vo.getPaymethod()       + "',";
		sql += "payamount="	    + vo.getPayamount()    	  + "',";
		sql += "payclassifi=" 	+ vo.getPayclassifi()     + "' ";
		
		sql += "where cmno = "  + vo.getCmno();
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}	
	
	
	public boolean Delete(String cmno)
	{
		this.DBOpen();
		
		String sql = "";

		sql = "delete from sps where cmno = " + cmno;
		this.RunCommand(sql);
		
		this.DBClose();
		
		return true;
	}
	
	public CarinfoVO Read(String cmno)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select carnum,entertime,exittime,timecal, ";
		sql	+= "enterpic,exitpic,paymethod,payamount,payclassifi from carinfo ";
		sql += "where cmno = " + cmno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		CarinfoVO vo = new CarinfoVO();
		vo.setCmno(cmno);
		vo.setCarnum(this.GetValue("carnum"));
		vo.setEntertime(this.GetValue("entertime"));
		vo.setExittime(this.GetValue("exittime"));
		vo.setTimecal(this.GetValue("timecal"));
		vo.setEnterpic(this.GetValue("enterpic"));
		vo.setExitpic(this.GetValue("exitpic"));
		vo.setPaymethod(this.GetValue("paymethod"));
		vo.setPayamount(this.GetValue("payamount"));
		vo.setPayclassifi(this.GetValue("payclassifi"));
	
		this.DBClose();
		return vo;
	}	
	
	public String timeDiff(String cmno)
	{
		String sql = "";
		
		this.DBOpen();
		
		sql  = "SELECT TIMESTAMPDIFF(minute, (select entertime from carinfo where cmno =" + cmno + "), (select exittime from carinfo where cmno =" + cmno + ")) AS time_diff;";
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		String time_diff = this.GetValue("time_diff");
		
		this.DBClose();
		return time_diff;
	}	
	
}
