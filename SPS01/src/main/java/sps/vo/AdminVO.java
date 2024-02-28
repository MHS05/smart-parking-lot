package sps.vo;

public class AdminVO 
{
	private String ano;	 	 //관리자 번호
	private String id;		 //아이디
	private String pw;		 //비밀번호

	//생성자
	public AdminVO()
	{
		ano		 = "";
		id       = "";
		pw       = "";
	}

	//getter
	public String getAno() 		{	return ano;			}
	public String getId() 		{	return id;			}
	public String getPw() 		{	return pw;			}

	//setter
	public void setAno(String ano) 			 {	this.ano = ano;				}
	public void setId(String id) 			 {	this.id  = id;				}
	public void setPw(String pw) 		     {	this.pw  = pw;				}
	
}
