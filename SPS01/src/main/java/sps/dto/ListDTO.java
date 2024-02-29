package sps.dto;

import java.util.ArrayList;
import sps.dao.*;
import sps.vo.*;

public class ListDTO extends DBManager
{
	//날짜 "2024-02-29" 받아서 해당 날짜 자동차 정보 리스트 가져옴 
	public ArrayList<CarinfoVO> getCarInfoList(String date)
	{
		ArrayList<CarinfoVO> list = new ArrayList<CarinfoVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select cmno,carnum,entertime,exittime from carinfo ";
		sql += "where entertime like '%" + date + "%'";
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			CarinfoVO vo = new CarinfoVO();
			vo.setCmno(this.GetValue("cmno"));
			vo.setCarnum(this.GetValue("carnum"));
			vo.setEntertime(this.GetValue("entertime"));
			vo.setExittime(this.GetValue("exittime"));
			
			/*
			if(this.GetValue("timecal")==null)
			{
				vo.setTimecal("");
			}else
			{
				vo.setTimecal(this.GetValue("timecal"));
			}
			
			if(this.GetValue("paymethod")==null)
			{
				vo.setPaymethod("");
			}else
			{
				vo.setPaymethod(this.GetValue("paymethod"));
			}
			
			if(this.GetValue("payamount")==null)
			{
				vo.setPayamount("");
			}else
			{
				vo.setPayamount(this.GetValue("payamount"));
			}
			
			if(this.GetValue("payclassifi")==null)
			{
				vo.setPayclassifi("");
			}else
			{
				vo.setPayclassifi(this.GetValue("payclassifi"));
			}
			*/
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
	
	//날짜 "2024-02-29" 받아서 해당 날짜 출차정보,결제정보 가져옴 
	public ArrayList<CarinfoVO> getExitInfoList(String date)
	{
		ArrayList<CarinfoVO> list = new ArrayList<CarinfoVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select cmno,carnum,entertime,exittime from carinfo ";
		sql += "where entertime like '%" + date + "%'";
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			CarinfoVO vo = new CarinfoVO();
			vo.setCmno(this.GetValue("cmno"));
			vo.setCarnum(this.GetValue("carnum"));
			vo.setEntertime(this.GetValue("entertime"));
			vo.setExittime(this.GetValue("exittime"));
			
			/*
			if(this.GetValue("timecal")==null)
			{
				vo.setTimecal("");
			}else
			{
				vo.setTimecal(this.GetValue("timecal"));
			}
			
			if(this.GetValue("paymethod")==null)
			{
				vo.setPaymethod("");
			}else
			{
				vo.setPaymethod(this.GetValue("paymethod"));
			}
			
			if(this.GetValue("payamount")==null)
			{
				vo.setPayamount("");
			}else
			{
				vo.setPayamount(this.GetValue("payamount"));
			}
			
			if(this.GetValue("payclassifi")==null)
			{
				vo.setPayclassifi("");
			}else
			{
				vo.setPayclassifi(this.GetValue("payclassifi"));
			}
			 */
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
}
