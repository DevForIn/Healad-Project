package logic;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;


public class Review {
	private int num;
	private String rvid; //리뷰 아이디
	private String userid; //user id
	@NotEmpty(message="비밀번호를 입력하세요")
	private String pwd; //user 비밀번호
	@NotEmpty(message="제목을 입력하세요")
	private String rvsubject; //제목
	@NotEmpty(message="내용을 입력하세요")
	private String rvcontent; //내용
	private MultipartFile rvfile;  //파일
	private String fileurl;	//파일 url
	private String rvip; //작성자 ip
	private Date rvregdate; //등록일자
	private Date rvupdate; //수정일자(관리자 댓글)
	private int rvreadcnt; //조회수
	private int rvscore; //추천수
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getRvid() {
		return rvid;
	}
	public void setRvid(String rvid) {
		this.rvid = rvid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getRvsubject() {
		return rvsubject;
	}
	public void setRvsubject(String rvsubject) {
		this.rvsubject = rvsubject;
	}
	public String getRvcontent() {
		return rvcontent;
	}
	public void setRvcontent(String rvcontent) {
		this.rvcontent = rvcontent;
	}
	public MultipartFile getRvfile() {
		return rvfile;
	}
	public void setRvfile(MultipartFile rvfile) {
		this.rvfile = rvfile;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public String getRvip() {
		return rvip;
	}
	public void setRvip(String rvip) {
		this.rvip = rvip;
	}
	public Date getRvregdate() {
		return rvregdate;
	}
	public void setRvregdate(Date rvregdate) {
		this.rvregdate = rvregdate;
	}
	public Date getRvupdate() {
		return rvupdate;
	}
	public void setRvupdate(Date rvupdate) {
		this.rvupdate = rvupdate;
	}
	public int getRvreadcnt() {
		return rvreadcnt;
	}
	public void setRvreadcnt(int rvreadcnt) {
		this.rvreadcnt = rvreadcnt;
	}
	public int getRvscore() {
		return rvscore;
	}
	public void setRvscore(int rvscore) {
		this.rvscore = rvscore;
	}
	@Override
	public String toString() {
		return "Review [rvid=" + rvid + ", userid=" + userid + ", pwd=" + pwd + ", rvsubject=" + rvsubject
				+ ", rvcontent=" + rvcontent + ", rvfile=" + rvfile + ", fileurl=" + fileurl + ", rvip=" + rvip
				+ ", rvregdate=" + rvregdate + ", rvupdate=" + rvupdate + ", rvreadcnt=" + rvreadcnt + ", rvscore="
				+ rvscore + ", getRvid()=" + getRvid() + ", getUserid()=" + getUserid() + ", getPwd()=" + getPwd()
				+ ", getRvsubject()=" + getRvsubject() + ", getRvcontent()=" + getRvcontent() + ", getRvfile()="
				+ getRvfile() + ", getFileurl()=" + getFileurl() + ", getRvip()=" + getRvip() + ", getRvregdate()="
				+ getRvregdate() + ", getRvupdate()=" + getRvupdate() + ", getRvreadcnt()=" + getRvreadcnt()
				+ ", getRvscore()=" + getRvscore() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
}
