package com.entity;


// id, oder_id, user_name, email, address, phone, book_name, author, price, payment

public class BookOrder {
	private int id;
	private String oder_id;
	private String user_name;
	private String email;
	private String fullAdd;
	private String phone;
	private String book_name;
	private String author;
	private String price;
	private String paymentType;
	private String order_time;
	private String order_status;
	
	
	
	

	public BookOrder() {
		super();
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOder_id() {
		return oder_id;
	}

	public void setOder_id(String oder_id) {
		this.oder_id = oder_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

	public String getFullAdd() {
		return fullAdd;
	}

	public void setFullAdd(String fullAdd) {
		this.fullAdd = fullAdd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	
	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getOrder_time() {
		return order_time;
	}

	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
	
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status=order_status;
	}

	@Override
	public String toString() {
		return "BookOrder [id=" + id + ", oder_id=" + oder_id + ", user_name=" + user_name + ", email=" + email
				+ ", fullAdd=" + fullAdd + ", phone=" + phone + ", book_name=" + book_name + ", author=" + author
				+ ", price=" + price + ", paymentType=" + paymentType + ", order_time=" + order_time + ", order_status="
				+ order_status + "]";
	}

	
	
	
	
	
	
	

}
