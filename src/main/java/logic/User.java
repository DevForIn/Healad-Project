package logic;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class User {
	@Size(min=5,max=12,message="! - 아이디는 5~12자리로 입력하세요. - !")
	private String USER_ID;
	@Size(min=5,max=14,message="! - 비밀번호는 5~14자로 입력하세요. - !")
	private String PWD;
	@NotEmpty(message="! - 사용자이름을 입력하세요. - !")
	private String USER_NAME;
	@NotEmpty(message="! - 전화번호를 입력하세요. - !")
	private String PHONE_NO;
	@NotEmpty(message="! - 우편번호를 입력하세요. - !")
	private String POST_CODE;
	@NotEmpty(message="! - 주소를 입력하세요. - !")
	private String ADDR;
	@NotEmpty(message="! - 상세주소 입력하세요. - !")
	private String ADDR_DETAIL;
	@NotEmpty(message="! - E-mail을 입력하세요. - !")
	@Email(message="! - E-mail 형식으로 입력하세요. - !")
	private String EMAIL;
	@NotNull(message="! - 생년월일을 입력하세요. - !")
	@Past(message="! - 생일은 미래일수 없습니다..! - !")	
	@DateTimeFormat(pattern="yyyy-MM-dd")	// 형식 오류 시 typeMismatch.birthday 코드 값 저장 
	private Date BIRTH_DATE;
	private Date JOIN_DATE;
	private String WITHDRAW_YN;
	private Date WITHDRAW_DATE;
	private int Mileage;	
	
	//setter,getter, toString	
	
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getPWD() {
		return PWD;
	}
	public void setPWD(String pWD) {
		PWD = pWD;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getPHONE_NO() {
		return PHONE_NO;
	}
	public void setPHONE_NO(String pHONE_NO) {
		PHONE_NO = pHONE_NO;
	}
	public String getPOST_CODE() {
		return POST_CODE;
	}
	public void setPOST_CODE(String pOST_CODE) {
		POST_CODE = pOST_CODE;
	}
	public String getADDR() {
		return ADDR;
	}
	public void setADDR(String aDDR) {
		ADDR = aDDR;
	}
	public String getADDR_DETAIL() {
		return ADDR_DETAIL;
	}
	public void setADDR_DETAIL(String aDDR_DETAIL) {
		ADDR_DETAIL = aDDR_DETAIL;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public Date getBIRTH_DATE() {
		return BIRTH_DATE;
	}
	public void setBIRTH_DATE(Date bIRTH_DATE) {
		BIRTH_DATE = bIRTH_DATE;
	}
	public Date getJOIN_DATE() {
		return JOIN_DATE;
	}
	public void setJOIN_DATE(Date jOIN_DATE) {
		JOIN_DATE = jOIN_DATE;
	}
	public String getWITHDRAW_YN() {
		return WITHDRAW_YN;
	}
	public void setWITHDRAW_YN(String wITHDRAW_YN) {
		WITHDRAW_YN = wITHDRAW_YN;
	}
	public Date getWITHDRAW_DATE() {
		return WITHDRAW_DATE;
	}
	public void setWITHDRAW_DATE(Date wITHDRAW_DATE) {
		WITHDRAW_DATE = wITHDRAW_DATE;
	}
	public int getMileage() {
		return Mileage;
	}
	public void setMileage(int mileage) {
		Mileage = mileage;
	}
	
	@Override
	public String toString() {
		return "User [USER_ID=" + USER_ID + ", PWD=" + PWD + ", USER_NAME=" + USER_NAME + ", PHONE_NO=" + PHONE_NO
				+ ", POST_CODE=" + POST_CODE + ", ADDR=" + ADDR + ", ADDR_DETAIL=" + ADDR_DETAIL + ", EMAIL=" + EMAIL
				+ ", BIRTH_DATE=" + BIRTH_DATE + ", JOIN_DATE=" + JOIN_DATE + ", WITHDRAW_YN=" + WITHDRAW_YN
				+ ", WITHDRAW_DATE=" + WITHDRAW_DATE + ", Mileage=" + Mileage + "]";
	}	
}
