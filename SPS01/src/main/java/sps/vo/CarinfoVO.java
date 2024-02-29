package sps.vo;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CarinfoVO 
{
	private String cmno;		//차량관리번호
	private String carnum;		//차량번호
	private String entertime;	//입차시간
	private String exittime;	//출차시간
	private String timecal;		//계산시간
	private String enterpic; 	//입차사진
	private String exitpic; 	//출차사진
	private String paymethod; 	//결제수단
	private String payamount; 	//결제금액
	private String payclassifi;	//결제구분
	
	
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
	

	
    public String EntertimeAsDate() {
        try {
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date parsedDate = inputFormat.parse(this.entertime);
            return outputFormat.format(parsedDate);
        } catch (Exception e) {
            e.printStackTrace();
            // 예외가 발생하면 오늘 날짜를 반환
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            return dateFormat.format(new Date());
        }
    }
    
}
