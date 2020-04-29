package product.model;

public class ProductVO {
	
	private int fk_cateno;           
	private String prodcode;           
	private String prodname;    
	private String prodimg;       
	
	public ProductVO() { }

	public ProductVO(int fk_cateno, String prodcode, String prodname, String prodimg) {
		super();
		this.fk_cateno = fk_cateno;
		this.prodcode = prodcode;
		this.prodname = prodname;
		this.prodimg = prodimg;
	}

	public int getFk_cateno() {
		return fk_cateno;
	}

	public void setFk_cateno(int fk_cateno) {
		this.fk_cateno = fk_cateno;
	}

	public String getProdcode() {
		return prodcode;
	}

	public void setProdcode(String prodcode) {
		this.prodcode = prodcode;
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

	
}
