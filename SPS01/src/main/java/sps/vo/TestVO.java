package sps.vo;

public class TestVO 
{
	private String no;
	private String id;
	private String image; 	//이미지_논리
	private String phyimage;//이미지_물리
	
	public TestVO()
	{
		no       = "";
		id		 = "";
		image    = ""; 
		phyimage = "";
	}
	
	//getter
	public String getNo() 		{	return no;			}
	public String getId() 		{	return id;			}
	public String getImage() 	{	return image;		}
	public String getPhyimage() {   return phyimage;	}
	
	//setter
	public void setNo(String no) 			{	this.no = no;				}
	public void setId(String id) 			{	this.id = id;			 	}
	public void setImage(String image) 		{	this.image = image;		 	}
	public void setPhyimage(String phyimage){	this.phyimage = phyimage;	}
	
}
