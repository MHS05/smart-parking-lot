package sps.vo;

public class CctvVO 
{
	private String managecctv;     //cctv������ȣ
	private String cctv; 	   //������cctv
	private String totalspace; //���ڸ���
	private String totalcar;   //����������
	
	public String getManagecctv()    { return managecctv; }
	public String getCctv()       { return cctv; }
	public String getTotalspace() { return totalspace; }
	public String getTotalcar()   { return totalcar; }
	
	public void setManagecctv(String managecctv) { this.managecctv = managecctv; }
	public void setCctv(String cctv)             { this.cctv = cctv; }
	public void setTotalspace(String totalspace) { this.totalspace = totalspace; }
	public void setTotalcar(String totalcar)     { this.totalcar = totalcar; }

}
