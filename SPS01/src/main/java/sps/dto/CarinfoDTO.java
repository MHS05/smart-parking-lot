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
	public CarinfoVO exitpicread(String exitpic)
	{
		String sql = "";
		
		this.DBOpen();
		
		sql  = "select * ";
		sql	+= "from carinfo ";
		sql += "where exitpic = " + exitpic;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		CarinfoVO vo = new CarinfoVO();
		vo.setExitpic(exitpic);
		vo.setCmno(this.GetValue("cmno"));
		vo.setCarnum(this.GetValue("carnum"));
		vo.setEntertime(this.GetValue("entertime"));
		vo.setExittime(this.GetValue("exittime"));
		vo.setTimecal(this.GetValue("timecal"));
		vo.setEnterpic(this.GetValue("enterpic"));
		vo.setPaymethod(this.GetValue("paymethod"));
		vo.setPayamount(this.GetValue("payamount"));
		vo.setPayclassifi(this.GetValue("payclassifi"));
		
		this.DBClose();
		return vo;
	}	
	
	//현재시간 - 입차시간 ( 분으로 출력 )
	public String Now_Enter(String cmno)
	{
		String sql = "";
		
		this.DBOpen();
		
		sql  = "SELECT TIMESTAMPDIFF(minute, (select entertime from carinfo where cmno =" + cmno + "), NOW()) AS now_enter;";
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		String now_enter = this.GetValue("now_enter");
		
		this.DBClose();
		return now_enter;
	}	
	
	// 출차시간 - 입차시간 ( 분으로 출력 )
	public String Exit_Enter(String cmno)
	{
		String sql = "";
		
		this.DBOpen();
		
		sql  = "SELECT TIMESTAMPDIFF(minute, (select entertime from carinfo where cmno =" + cmno + "), (select exittime from carinfo where cmno =" + cmno + ")) AS exit_enter;";
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		String exit_enter = this.GetValue("exit_enter");
		
		this.DBClose();
		return exit_enter;
	}
	
	
	// 날짜 
	public String Date_Format(String entertime)
	{
		String sql = "";
		
		this.DBOpen();
		
		sql  = "SELECT DATE_FORMAT(CREATE_DATE, '%Y-%m-%d) AS CREATE_DATE;";
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		String date = this.GetValue("entertime");
		
		this.DBClose();
		return date;
	}	
	
}
