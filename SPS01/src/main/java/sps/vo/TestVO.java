package sps.vo;

public class TestVO 
{
	private String no;
	private String id;
	private String enterpic; 	//이미지_논리
	
	public TestVO()
	{
		no       = "";
		id		 = "";
		enterpic    = ""; 
	}
	
	//getter
	public String getNo() 		{	return no;			}
	public String getId() 		{	return id;			}
	public String getEnterpic() 	{	return enterpic;		}
	
	//setter
	public void setNo(String no) 			{	this.no = no;				}
	public void setId(String id) 			{	this.id = id;			 	}
	public void setEnterpic(String enterpic) 		{	this.enterpic = enterpic;		 	}
	
}
