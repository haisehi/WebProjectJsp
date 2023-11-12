package Model;

public class CartItem {
    private Food food;
    private int quantity;
    private Customer customer; // Add Customer property

    public CartItem(Food food, int quantity, Customer customer) {
        this.food = food;
        this.quantity = quantity;
        this.customer = customer;
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}
