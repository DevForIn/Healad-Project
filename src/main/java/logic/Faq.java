package logic;

public class Faq {
	private int faqId;	// FAQ Num
	private String QUESTION;	// FAQ 질문 (제목)
	private String ANSWER;		// FAQ 답변 (내용)
	
	
	public int getFaqId() {
		return faqId;
	}
	public void setFaqId(int faqId) {
		this.faqId = faqId;
	}
	public String getQUESTION() {
		return QUESTION;
	}
	public void setQUESTION(String qUESTION) {
		QUESTION = qUESTION;
	}
	public String getANSWER() {
		return ANSWER;
	}
	public void setANSWER(String aNSWER) {
		ANSWER = aNSWER;
	}
	@Override
	public String toString() {
		return "Faq [faqId=" + faqId + ", QUESTION=" + QUESTION + ", ANSWER=" + ANSWER + "]";
	}
	
	
}
