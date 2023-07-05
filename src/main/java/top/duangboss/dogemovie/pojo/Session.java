package top.duangboss.dogemovie.pojo;

public class Session {
	private int sid;
	private int sfid;
	private int shid;
	private String scname;
	private String shname;
	private String sfname;
	
	private String stime;
	private String sseatstate;
	private float sprice;
	
	private String end;
	private int state;
	
	public String getScname() {
		return scname;
	}
	
	public void setScname(String scname) {
		this.scname = scname;
	}
	public String getShname() {
		return shname;
	}
	public void setShname(String shname) {
		this.shname = shname;
	}
	public String getSfname() {
		return sfname;
	}
	public void setSfname(String sfname) {
		this.sfname = sfname;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getSfid() {
		return sfid;
	}
	public void setSfid(int sfid) {
		this.sfid = sfid;
	}
	public int getShid() {
		return shid;
	}
	public void setShid(int shid) {
		this.shid = shid;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getSseatstate() {
		return sseatstate;
	}
	public void setSseatstate(String sseatstate) {
		this.sseatstate = sseatstate;
	}
	public float getSprice() {
		return sprice;
	}
	public void setSprice(float sprice) {
		this.sprice = sprice;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}
