package sps.vo;

public class CctvVO 
{
	private String  cctv; 	    //������cctv
	private Integer totalspace; //���ڸ���
	private Integer totalcar; 	//����������
	
	public String getCctv()        { return cctv; }
	public Integer getTotalspace() { return totalspace; }
	public Integer getTotalcar()   { return totalcar; }
	
	public void setCctv(String cctv)              { this.cctv = cctv; }
	public void setTotalspace(Integer totalspace) { this.totalspace = totalspace; }
	public void setTotalcar(Integer totalcar)     { this.totalcar = totalcar; }

}
