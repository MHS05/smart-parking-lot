package sps.vo;

public class AdminVO 
{
	private String ano;	 	 //������ ��ȣ
	private String id;		 //���̵�
	private String pw;		 //��й�ȣ

	//������
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
