package sps.dto;

import sps.dao.*;
import sps.vo.*;

public class CctvDTO extends DBManager
{

	
	public boolean Insert(CctvVO vo)
	{
		this.DBOpen();
		
		String sql = "";
		sql += "insert into parkingcardetect (cctv, totalspace, totalcar) ";
		sql += "values (";
		sql += "'" + vo.getCctv() + "', ";
		sql += "'" + vo.getTotalspace() + "', ";
		sql += "'" + vo.getTotalcar() + "'";
		sql += ")";
		this.RunCommand(sql);
		
		sql = "select last_insert_id() as managecctv ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setManagecctv(this.GetValue("managecctv"));
		
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
