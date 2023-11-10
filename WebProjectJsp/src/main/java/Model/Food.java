package Model;

public class Food {
    private int id_food;
    private String name_food;
    private String image_food;
    private double price;
    private int id_categories;

    public Food(int id_food, String name_food, String image_food, double price, int id_categories) {
        this.id_food = id_food;
        this.name_food = name_food;
        this.image_food = image_food;
        this.price = price;
        this.id_categories = id_categories;
    }

    // Getter and Setter methods
    public int getId_food() {
        return id_food;
    }

    public void setId_food(int id_food) {
        this.id_food = id_food;
    }

    public String getName_food() {
        return name_food;
    }

    public void setName_food(String name_food) {
        this.name_food = name_food;
    }

    public String getImage_food() {
        return image_food;
    }

    public void setImage_food(String image_food) {
        this.image_food = image_food;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getId_categories() {
        return id_categories;
    }

    public void setId_categories(int id_categories) {
        this.id_categories = id_categories;
    }

    // Other methods if needed
}
