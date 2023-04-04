package poly.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Inventory {
	@Id
	@GeneratedValue
	@Column(name = "Id")
	private int id;
	private String name;
	private String address;
	private float rentPrice;
	private int term;
	@OneToMany(mappedBy = "embeddedId.inventory", fetch = FetchType.EAGER)
	private Collection<InventoryCapability> inventoryCapability;
	
	public Inventory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Inventory(int id, String name, String address, float rentPrice, int term) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.rentPrice = rentPrice;
		this.term = term;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public float getRentPrice() {
		return rentPrice;
	}

	public void setRentPrice(float rentPrice) {
		this.rentPrice = rentPrice;
	}

	public int getTerm() {
		return term;
	}

	public void setTerm(int term) {
		this.term = term;
	}
	
	
	
}