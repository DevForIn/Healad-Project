package exception;

public class CartException extends RuntimeException {
	private String url;
	public CartException(String msg, String url) {
		super(msg);
		this.url=url;
	}
	public String getUrl() {
		return url;
	}
}
