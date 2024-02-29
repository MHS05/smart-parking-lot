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
	
	//회차차량수 구하는 함수
		public int getTruning(String date) 
		{
			this.DBOpen();
			
			String t = "";
			String sql = "";
			
			sql  = "select count(payclassifi = '회차') as turning from carinfo ";
			sql += "where entertime != exittime ";
			sql += "and entertime like '%" + date + "%' ";
			this.RunSelect(sql);
			
			
			while( this.GetNext() == true)
			{
				t = this.GetValue("turning");
				
			}
			
			int turning = Integer.parseInt(t);
			
			return turning;
		}
		
		//일반차량수 구하는 함수
		public int getGeneral(String date) 
		{
			this.DBOpen();
			
			String g = "";
			String sql = "";
			
			sql  = "select count(payclassifi = '일반') as general from carinfo ";
			sql += "where entertime != exittime ";
			sql += "and entertime like '%" + date + "%' ";
			this.RunSelect(sql);
			
			while( this.GetNext() == true)
			{
				g = this.GetValue("general");
				
			}
			
			int general = Integer.parseInt(g);
			
			return general;
		}
		
		//현금 결제 금액 구하는 함수
		public int getCash(String date) 
		{
			this.DBOpen();
			
			String c = "";
			String sql = "";
			
			sql  = "select sum(payamount) as cash from carinfo ";
			sql += "where entertime like '%" + date + "%' ";
			sql += "and paymethod = '현금'";
			this.RunSelect(sql);
			
			
			while( this.GetNext() == true)
			{
				c = this.GetValue("cash");
				
			}
			
			int cash = Integer.parseInt(c);
			
			return cash;
		}
		
		//카드 결제 금액 구하는 함수
		public int getCard(String date) 
		{
			this.DBOpen();
			
			String c = "";
			String sql = "";
			
			sql  = "select sum(payamount) as card from carinfo ";
			sql += "where entertime like '%" + date + "%' ";
			sql += "and paymethod = '카드'";
			this.RunSelect(sql);
			
			
			while( this.GetNext() == true)
			{
				c = this.GetValue("card");
				
			}
			
			int card = Integer.parseInt(c);
			
			return card;
		}
		
		//회차차량수 구하는 함수
		public int getTruning2(String date) 
		{
			this.DBOpen();
			
			String t = "";
			String sql = "";
			
			sql  = "select count(*) as turning from carinfo ";
			sql += "where entertime != exittime ";
			sql += "and timecal < 10 ";
			sql += "and entertime like '%" + date + "%' ";
			this.RunSelect(sql);
			
			
			while( this.GetNext() == true)
			{
				t = this.GetValue("turning");
				
			}
			
			int turning = Integer.parseInt(t);
			
			return turning;
		}
}
