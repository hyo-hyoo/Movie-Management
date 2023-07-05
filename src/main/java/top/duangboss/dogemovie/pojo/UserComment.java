package top.duangboss.dogemovie.pojo;

public class UserComment {
	private int ucid;
	private int ucuid;
	private int ucfid;
	private String uctime;
	private String uccontent;
	private int ucscore;
	
	private String uc_uname;
	
	public int getUcid() {
		return ucid;
	}
	public void setUcid(int ucid) {
		this.ucid = ucid;
	}
	public int getUcuid() {
		return ucuid;
	}
	public void setUcuid(int ucuid) {
		this.ucuid = ucuid;
	}
	public int getUcfid() {
		return ucfid;
	}
	public void setUcfid(int ucfid) {
		this.ucfid = ucfid;
	}
	public String getUctime() {
		return uctime;
	}
	public void setUctime(String uctime) {
		this.uctime = uctime;
	}
	public String getUccontent() {
		return uccontent;
	}
	public void setUccontent(String uccontent) {
		this.uccontent = uccontent;
	}
	public int getUcscore() {
		return ucscore;
	}
	public void setUcscore(int ucscore) {
		this.ucscore = ucscore;
	}
	public String getUc_uname() {
		return uc_uname;
	}
	public void setUcuname(String uc_uname) {
		this.uc_uname = uc_uname;
	}
	
}
