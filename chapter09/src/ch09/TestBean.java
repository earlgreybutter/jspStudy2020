package ch09;

import java.util.Date;

public class TestBean {

	// 1. ������ private�� �����Ѵ� 
	private String name;
	private int age;

	private String phone;
	
	// setter�� getter �����
	// ����� ������ ������ �� ��
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
	
	// java�� src�ؿ� �����, jsp�� webcontent�ؿ� �����
	
}
