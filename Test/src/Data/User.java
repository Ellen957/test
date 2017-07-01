/**
 * 
 */
package Data;

/**
 * @author Administrator
 *
 */
public class User {
	private Integer ID;
	private String Name;
	private String Sex;
	private Integer Age;
	
	public User(){}
	
	public User(Integer iD, String name, String sex, Integer age) {
		super();
		ID = iD;
		Name = name;
		Sex = sex;
		Age = age;
	}
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}
	public Integer getAge() {
		return Age;
	}
	public void setAge(Integer age) {
		Age = age;
	}
	
	
}
