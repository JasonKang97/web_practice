package pack;

public class Jspex12Logic {
	private Jspex12FormBean formBean;
	
	public void setFormBean(Jspex12FormBean formBean) {
		this.formBean = formBean;
	}
	
	public int getCal() {
		return formBean.getPrice()-formBean.getDiscount();
	}
	
}
