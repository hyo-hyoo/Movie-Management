package top.duangboss.dogemovie.pojo;

public class Film {
	private int fid;          //电影编号
	private String fname_cn;  //中文名
	private String fname_en;  //英文名
	private String fprofile;  //简介
	private String fregion;   //地区
	private String freleasetime; //上映时间
	private int flength;         //时长
	private float fscore;        //评分
	private float fboxoffice;    //票房
	private int fspid;           //海报编码
	private int flikes;          //想看人数
	private String fstate;         //电影状态
	
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getFname_cn() {
		return fname_cn;
	}
	public void setFname_cn(String fname_cn) {
		this.fname_cn = fname_cn;
	}
	public String getFname_en() {
		return fname_en;
	}
	public void setFname_en(String fname_en) {
		this.fname_en = fname_en;
	}
	public String getFprofile() {
		return fprofile;
	}
	public void setFprofile(String fprofile) {
		this.fprofile = fprofile;
	}
	public String getFregion() {
		return fregion;
	}
	public void setFregion(String fregion) {
		this.fregion = fregion;
	}
	public String getFreleasetime() {
		return freleasetime;
	}
	public void setFreleasetime(String freleasetime) {
		this.freleasetime = freleasetime;
	}
	public int getFlength() {
		return flength;
	}
	public void setFlength(int flength) {
		this.flength = flength;
	}
	public float getFscore() {
		return fscore;
	}
	public void setFscore(float fscore) {
		this.fscore = fscore;
	}
	public float getFboxoffice() {
		return fboxoffice;
	}
	public void setFboxoffice(float fboxoffice) {
		this.fboxoffice = fboxoffice;
	}
	public int getFspid() {
		return fspid;
	}
	public void setFspid(int fspid) {
		this.fspid = fspid;
	}
	public int getFlikes() {
		return flikes;
	}
	public void setFlikes(int flikes) {
		this.flikes = flikes;
	}
	public String getFstate() {
		return fstate;
	}
	public void setFstate(String fstate) {
		this.fstate = fstate;
	}
	
}
