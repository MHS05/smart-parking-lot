package sps.vo;

public class CctvVO 
{
	private String managecctv;     //cctv관리번호
	private String cctv; 	   //주차장cctv
	private String totalspace; //총자리수
	private String totalcar;   //현재차량수
	
	public String getManagecctv()    { return managecctv; }
	public String getCctv()       { return cctv; }
	public String getTotalspace() { return totalspace; }
	public String getTotalcar()   { return totalcar; }
	
	public void setManagecctv(String managecctv) { this.managecctv = managecctv; }
	public void setCctv(String cctv)             { this.cctv = cctv; }
	public void setTotalspace(String totalspace) { this.totalspace = totalspace; }
	public void setTotalcar(String totalcar)     { this.totalcar = totalcar; }

}
