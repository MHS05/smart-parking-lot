package sps.dto;

import java.util.ArrayList;
import sps.dao.*;
import sps.vo.*;

public class ListDTO extends DBManager
{
	//��¥ "2024-02-29" �޾Ƽ� �ش� ��¥ �ڵ��� ���� ����Ʈ ������ 
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
	
	//��¥ "2024-02-29" �޾Ƽ� �ش� ��¥ ��������,�������� ������ 
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
	
	//ȸ�������� ���ϴ� �Լ�
		public int getTruning(String date) 
		{
			this.DBOpen();
			
			String t = "";
			String sql = "";
			
			sql  = "select count(payclassifi = 'ȸ��') as turning from carinfo ";
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
		
		//�Ϲ������� ���ϴ� �Լ�
		public int getGeneral(String date) 
		{
			this.DBOpen();
			
			String g = "";
			String sql = "";
			
			sql  = "select count(payclassifi = '�Ϲ�') as general from carinfo ";
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
		
		//���� ���� �ݾ� ���ϴ� �Լ�
		public int getCash(String date) 
		{
			this.DBOpen();
			
			String c = "";
			String sql = "";
			
			sql  = "select sum(payamount) as cash from carinfo ";
			sql += "where entertime like '%" + date + "%' ";
			sql += "and paymethod = '����'";
			this.RunSelect(sql);
			
			
			while( this.GetNext() == true)
			{
				c = this.GetValue("cash");
				
			}
			
			int cash = Integer.parseInt(c);
			
			return cash;
		}
		
		//ī�� ���� �ݾ� ���ϴ� �Լ�
		public int getCard(String date) 
		{
			this.DBOpen();
			
			String c = "";
			String sql = "";
			
			sql  = "select sum(payamount) as card from carinfo ";
			sql += "where entertime like '%" + date + "%' ";
			sql += "and paymethod = 'ī��'";
			this.RunSelect(sql);
			
			
			while( this.GetNext() == true)
			{
				c = this.GetValue("card");
				
			}
			
			int card = Integer.parseInt(c);
			
			return card;
		}
		
		//ȸ�������� ���ϴ� �Լ�
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
