package logic;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int noid; // id
	private String nosuject; //제목
	private String nocontent; //내용
	private int nocnt; //조회수
	private MultipartFile nofile; //파일
	private String nofileurl; //파일url
	private Date noregdate; //등록일자
	
	public int getNoid() {
		return noid;
	}
	public void setNoid(int noid) {
		this.noid = noid;
	}
	public String getNosuject() {
		return nosuject;
	}
	public void setNosuject(String nosuject) {
		this.nosuject = nosuject;
	}
	public String getNocontent() {
		return nocontent;
	}
	public void setNocontent(String nocontent) {
		this.nocontent = nocontent;
	}
	public int getNocnt() {
		return nocnt;
	}
	public void setNocnt(int nocnt) {
		this.nocnt = nocnt;
	}
	public MultipartFile getNofile() {
		return nofile;
	}
	public void setNofile(MultipartFile nofile) {
		this.nofile = nofile;
	}
	public String getNofileurl() {
		return nofileurl;
	}
	public void setNofileurl(String nofileurl) {
		this.nofileurl = nofileurl;
	}
	public Date getNoregdate() {
		return noregdate;
	}
	public void setNoregdate(Date noregdate) {
		this.noregdate = noregdate;
	}
	@Override
	public String toString() {
		return "Notice [noid=" + noid + ", nosuject=" + nosuject + ", nocontent=" + nocontent + ", nocnt=" + nocnt
				+ ", nofile=" + nofile + ", nofileurl=" + nofileurl + ", noregdate=" + noregdate + ", getNoid()="
				+ getNoid() + ", getNosuject()=" + getNosuject() + ", getNocontent()=" + getNocontent()
				+ ", getNocnt()=" + getNocnt() + ", getNofile()=" + getNofile() + ", getNofileurl()=" + getNofileurl()
				+ ", getNoregdate()=" + getNoregdate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	

}
