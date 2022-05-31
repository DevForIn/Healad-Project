package logic;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int noticeId; 
	
	@NotEmpty(message="( ! ) 정보 입력 필요.")
	private String noSubject; //제목
	
	@NotEmpty(message="( ! ) 정보 입력 필요.")
	private String noContent; //내용
	
	private int noReadCnt; //조회수
	
	private MultipartFile noFile; //파일
	
	private String noFileUrl; //파일url
	
	private Date noRegDate; //등록일자

	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public String getNoSubject() {
		return noSubject;
	}

	public void setNoSubject(String noSubject) {
		this.noSubject = noSubject;
	}

	public String getNoContent() {
		return noContent;
	}

	public void setNoContent(String noContent) {
		this.noContent = noContent;
	}

	public int getNoReadCnt() {
		return noReadCnt;
	}

	public void setNoReadCnt(int noReadCnt) {
		this.noReadCnt = noReadCnt;
	}

	public MultipartFile getNoFile() {
		return noFile;
	}

	public void setNoFile(MultipartFile noFile) {
		this.noFile = noFile;
	}

	public String getNoFileUrl() {
		return noFileUrl;
	}

	public void setNoFileUrl(String noFileUrl) {
		this.noFileUrl = noFileUrl;
	}

	public Date getNoRegDate() {
		return noRegDate;
	}

	public void setNoRegDate(Date noRegDate) {
		this.noRegDate = noRegDate;
	}

	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", noSubject=" + noSubject + ", noContent=" + noContent + ", noReadCnt="
				+ noReadCnt + ", noFile=" + noFile + ", noFileUrl=" + noFileUrl + ", noRegDate=" + noRegDate + "]";
	}

}
