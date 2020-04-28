package ch09;

import java.util.Date;

public class TestBean {

	// 1. 변수는 private로 선언한다 
	private String name;
	private int age;

	private String phone;
	
	// setter와 getter 만들기
	// 절대로 손으로 만들지 말 것
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	// java는 src밑에 만들고, jsp는 webcontent밑에 만든다
	
}
