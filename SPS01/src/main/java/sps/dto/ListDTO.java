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
		
		sql  = "select cmno,carnum,entertime,exittime,paymethod,payamount,payclassifi from carinfo ";
		sql += "where entertime != exittime and entertime like '%" + date + "%'";
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			CarinfoVO vo = new CarinfoVO();
			vo.setCmno(this.GetValue("cmno"));
			vo.setCarnum(this.GetValue("carnum"));
			vo.setEntertime(this.GetValue("entertime"));
			vo.setExittime(this.GetValue("exittime"));
			if(this.GetValue("paymethod")==null)
			{
				vo.setPaymethod("?");
			}else
			{
				vo.setPaymethod(this.GetValue("paymethod"));
			}
			
			if(this.GetValue("payamount")==null)
			{
				vo.setPayamount("?");
			}else
			{
				vo.setPayamount(this.GetValue("payamount"));
			}
			
			if(this.GetValue("payclassifi")==null)
			{
				vo.setPayclassifi("?");
			}else
			{
				vo.setPayclassifi(this.GetValue("payclassifi"));
			}
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
			
			sql  = "select count(*) as turning from carinfo ";
			sql += "where payclassifi = 'ȸ��' ";
			sql += "and entertime like '%" + date + "%' ";
			this.RunSelect(sql);
			
			
			while( this.GetNext() == true)
			{
				t = this.GetValue("turning");
				
			}
			
			int turning = 0;
			
			try 
			{
				turning = Integer.parseInt(t);
			} catch (Exception e) {}
			
			return turning;
		}
		
		//�Ϲ������� ���ϴ� �Լ�
		public int getGeneral(String date) 
		{
			this.DBOpen();
			
			String g = "";
			String sql = "";
			
			sql  = "select count(*) as general from carinfo ";
			sql += "where payclassifi = '�Ϲ�' ";
			sql += "and entertime like '%" + date + "%' ";
			this.RunSelect(sql);
			
			while( this.GetNext() == true)
			{
				g = this.GetValue("general");
				
			}
			
			int general = 0;
			
			try
			{
			general = Integer.parseInt(g);
			}catch (Exception e) {}
			
			return general;
		}
		
		//���� ���� �� �ݾ�, �Ǽ� ���ϴ� �Լ�
		public ArrayList<Integer> getCash(String date) 
		{
			this.DBOpen();
			
			ArrayList<Integer> list = new ArrayList<Integer>();
			
			String sql = "";
			
			sql  = "select sum(payamount) as cash, count(*) as count from carinfo ";
			sql += "where entertime like '%" + date + "%' ";
			sql += "and paymethod = 'cash'";
			this.RunSelect(sql);
			
			
			while( this.GetNext() == true)
			{
				int cash = 0;
				
				if(this.GetValue("cash") != null)
				{
					String c = this.GetValue("cash");
					cash = Integer.parseInt(c);
				}
				
				String co = this.GetValue("count");
				int count = Integer.parseInt(co);
				
				list.add(count);
				list.add(cash);
				
			}
			
			return list;
		}
		
		//ī�� ���� �� �ݾ�, �Ǽ� ���ϴ� �Լ�
		public ArrayList<Integer> getCard(String date) 
		{
			this.DBOpen();
			
			ArrayList<Integer> list = new ArrayList<Integer>();
			
			String sql = "";
			
			sql  = "select sum(payamount) as card, count(*) as count from carinfo ";
			sql += "where entertime like '%" + date + "%' ";
			sql += "and paymethod = 'card'";
			this.RunSelect(sql);
			
			
			while( this.GetNext() == true)
			{
				int card = 0;
				
				if(this.GetValue("card") != null)
				{
					String c = this.GetValue("card");
					card = Integer.parseInt(c);
				}
				
				String co = this.GetValue("count");
				int count = Integer.parseInt(co);
				
				list.add(count);
				list.add(card);
				
			}
			
			
			return list;
		}
}
