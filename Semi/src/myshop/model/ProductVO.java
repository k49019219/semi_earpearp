package myshop.model;

public class ProductVO {

	private String prodcode;
	private int cateno;
	private String prodname;
	private String prodimg;
	private int price;
	private int saleprice;
	private String model;
	
	public String getProdcode() {
		return prodcode;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}

	public void setProdcode(String prodcode) {
		this.prodcode = prodcode;
	}
	public int getCateno() {
		return cateno;
	}
	public void setCateno(int cateno) {
		this.cateno = cateno;
	}
	public String getProdname() {
		return prodname;
	}
	public void setProdname(String prodname) {
		this.prodname = prodname;
	}
	public String getProdimg() {
		return prodimg;
	}
	public void setProdimg(String prodimg) {
		this.prodimg = prodimg;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	
	
}
