package test.member.dto;

public class MemberDto {
	private int num;
	private String name;
	private String addr;
	
	public MemberDto() {}
	//alt + shift + s + o 은 생성자 만들기 단축키
	public MemberDto(int num, String name, String addr) {
		super();
		this.num = num;
		this.name = name;
		this.addr = addr;
	}
	//alt + shift + s + r 은 getter setter 단축키
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
}
