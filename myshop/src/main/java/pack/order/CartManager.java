package pack.order;

import java.util.Hashtable;

public class CartManager {
	private Hashtable<String, Object> hCart = new Hashtable<String, Object>();
	
	public void addCart(OrderBean obean) {
		String product_no = obean.getProduct_no();
		int quantity = Integer.parseInt(obean.getQuantity());
		
		if(quantity > 0) {
			// 동일상품 주문 시 주문 수량만 증가
			if(hCart.containsKey(product_no)) {
				OrderBean temp = (OrderBean)hCart.get(product_no);
				quantity += Integer.parseInt(temp.getQuantity());
				temp.setQuantity(Integer.toString(quantity));
				hCart.put(product_no, temp);
			}else {	// 새 상품 주문 시
				hCart.put(product_no, obean);				
			}
		}
	}
	
	public Hashtable<String, Object> getCartList(){
		return hCart;
	}
	
	public void updateCart(OrderBean obean) {
		String product_no = obean.getProduct_no();
		hCart.put(product_no, obean);
	}
	
	public void deleteCart(OrderBean obean) {
		String product_no = obean.getProduct_no();
		hCart.remove(product_no);
	}
}
