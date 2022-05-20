package logic;

import java.util.Date;

public class Faq {
	private int fqid; //id
	private String question; //질문
	private String answer; //답변
	private Date fqregdate; //등록일자(?) 필요한지 모르겠음
	public int getFqid() {
		return fqid;
	}
	public void setFqid(int fqid) {
		this.fqid = fqid;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getFqregdate() {
		return fqregdate;
	}
	public void setFqregdate(Date fqregdate) {
		this.fqregdate = fqregdate;
	}
	@Override
	public String toString() {
		return "Faq [fqid=" + fqid + ", question=" + question + ", answer=" + answer + ", fqregdate=" + fqregdate
				+ ", getFqid()=" + getFqid() + ", getQuestion()=" + getQuestion() + ", getAnswer()=" + getAnswer()
				+ ", getFqregdate()=" + getFqregdate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
}
