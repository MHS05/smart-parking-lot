package sps.vo;

public class CctvVO 
{
	private String  cctv; 	    //주차장cctv
	private Integer totalspace; //총자리수
	private Integer totalcar; 	//현재차량수
	
	public String getCctv()        { return cctv; }
	public Integer getTotalspace() { return totalspace; }
	public Integer getTotalcar()   { return totalcar; }
	
	public void setCctv(String cctv)              { this.cctv = cctv; }
	public void setTotalspace(Integer totalspace) { this.totalspace = totalspace; }
	public void setTotalcar(Integer totalcar)     { this.totalcar = totalcar; }

}
