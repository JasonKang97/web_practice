package pack2;

public class Goods {	// 장바구니의 담을 상품 정보들용 DTO(VO)
	private String name;
	private int price;
	
	public Goods(String name, int price) {
		this.name=name;
		this.price=price;
	}
	
	public String getName() {
		return name;
	}
	
	public int getPrice() {
		return price;
	}
	
}
