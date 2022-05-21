package logic;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class User {
	
	@Size(min=5,max=12)
	private String userId;
	
	@Size(min=5,max=14,message="! - 비밀번호는 5~14자로 입력하세요. - !")
	@NotEmpty
	private String pwd;
	
	@NotEmpty(message="! - 닉네임을 입력하세요. - !")
	private String userName;
	
	@NotEmpty(message="! - 전화번호를 입력하세요. - !")
	private String phoneNo;
	
	@NotEmpty(message="! - 우편번호를 입력하세요. - !")
	private String postCode;
	
	@NotEmpty(message="! - 주소를 입력하세요. - !")
	private String addr;
	
	@NotEmpty(message="! - 상세주소 입력하세요. - !")
	private String addrDetail;
	
	@NotEmpty(message="! - E-mail을 입력하세요. - !")
	@Email(message="! - E-mail 형식으로 입력하세요. - !")
	private String email;
	
	@NotNull(message="! - 생년월일을 입력하세요. - !")
	@Past(message="! - 생일은 미래일수 없습니다..! - !")	
	@DateTimeFormat(pattern="yyyy-MM-dd")	// 형식 오류 시 typeMismatch.birthday 코드 값 저장 
	private Date birthDate;
	
	private Date joinDate;
	
	private String withdrawYn;
	
	private Date withdrawDate;
	
	private int mileage;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getWithdrawYn() {
		return withdrawYn;
	}
	public void setWithdrawYn(String withdrawYn) {
		this.withdrawYn = withdrawYn;
	}
	public Date getWithdrawDate() {
		return withdrawDate;
	}
	public void setWithdrawDate(Date withdrawDate) {
		this.withdrawDate = withdrawDate;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", pwd=" + pwd + ", userName=" + userName + ", phoneNo=" + phoneNo
				+ ", postCode=" + postCode + ", addr=" + addr + ", addrDetail=" + addrDetail + ", email=" + email
				+ ", birthDate=" + birthDate + ", joinDate=" + joinDate + ", withdrawYn=" + withdrawYn
				+ ", withdrawDate=" + withdrawDate + ", mileage=" + mileage + "]";
	}	
	
	
}
