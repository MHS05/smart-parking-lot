package sps.vo;

public class CarinfoVO 
{
	private String cmno;		//����������ȣ
	private String carnum;		//������ȣ
	private String entertime;	//�����ð�
	private String exittime;	//�����ð�
	private String timecal;		//���ð�
	private String enterpic; 	//��������
	private String exitpic; 	//��������
	private String paymethod; 	//��������
	private String payamount; 	//�����ݾ�
	private String payclassifi;	//��������
	
	
	public CarinfoVO()
	{
		cmno      	 = "";
		carnum	     = "";
		entertime    = ""; 
		exittime     = ""; 
		timecal      = ""; 
		enterpic     = ""; 
		exitpic    	 = ""; 
		paymethod    = ""; 
		paymethod    = ""; 
		payamount    = ""; 
		payclassifi  = ""; 
	}
	
	//getter
	public String getCmno() 		{	return cmno;			}
	public String getCarnum() 		{	return carnum;			}
	public String getEntertime() 	{	return entertime;		}
	public String getExittime()		{	return exittime;		}
	public String getTimecal() 		{	return timecal;			}
	public String getEnterpic() 	{	return enterpic;		}
	public String getExitpic() 		{	return exitpic;			}
	public String getPaymethod() 	{	return paymethod;		}
	public String getPayamount() 	{	return payamount;		}
	public String getPayclassifi()  {	return payclassifi;		}

	//setter
	public void setCmno(String cmno) 				{	this.cmno = cmno;					}
	public void setCarnum(String carnum) 			{	this.carnum = carnum;				}
	public void setEntertime(String entertime) 		{	this.entertime = entertime;			}
	public void setExittime(String exittime) 		{	this.exittime = exittime;			}
	public void setTimecal(String timecal)		    {	this.timecal = timecal;				}
	public void setEnterpic(String enterpic) 		{	this.enterpic = enterpic;			}
	public void setExitpic(String exitpic) 			{	this.exitpic = exitpic;				}
	public void setPaymethod(String paymethod) 		{	this.paymethod = paymethod;			}
	public void setPayamount(String payamount) 		{	this.payamount = payamount;			}
	public void setPayclassifi(String payclassifi)  {	this.payclassifi = payclassifi;		}
	
}
