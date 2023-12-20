package Model;

public class Payment {
    private int id_payment;
    private String name_food;
    private double price;
    private double total;
    private int quantity;
    private String fullName;
    private String email;
    private String address;
    private int id_customer;

    public Payment(int id_payment, String name_food, double price, double total, int quantity, String fullName, String email, String address, int id_customer) {
        this.id_payment = id_payment;
        this.name_food = name_food;
        this.price = price;
        this.total = total;
        this.quantity = quantity;
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.id_customer = id_customer;
    }

    // Getter and Setter methods

    public int getId_payment() {
        return id_payment;
    }

    public void setId_payment(int id_payment) {
        this.id_payment = id_payment;
    }

    public String getName_food() {
        return name_food;
    }

    public void setName_food(String name_food) {
        this.name_food = name_food;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public int getId_customer() {
        return id_customer;
    }

    public void setId_customer(int id_customer) {
        this.id_customer = id_customer;
    }
}
