package Demo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import Model.CartItem;
import Model.Food;

public class ShoppingCart {
    private static List<CartItem> cartItems = new ArrayList<>();

    public static void addToCart(Food food) {
        // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
        for (CartItem item : cartItems) {
            if (item.getFood().getId_food() == food.getId_food()) {
                // Nếu đã tồn tại, tăng số lượng
                item.setQuantity(item.getQuantity() + 1);
                return;
            }
        }

        // Nếu chưa tồn tại, thêm mới vào giỏ hàng
        CartItem newItem = new CartItem(food, 1);
        cartItems.add(newItem);
    }
    
    public static void removeFromCart(int foodId) {
        // Dùng Iterator để loại bỏ phần tử trong quá trình lặp
        Iterator<CartItem> iterator = cartItems.iterator();
        while (iterator.hasNext()) {
            CartItem item = iterator.next();
            if (item.getFood().getId_food() == foodId) {
                // Nếu là sản phẩm cần xoá, loại bỏ khỏi giỏ hàng
                iterator.remove();
                return;
            }
        }
    }

    public static void clearCart() {
        cartItems.clear();
    }

    public static List<CartItem> getCartItems() {
        return cartItems;
    }

    public static double getGrandTotal() {
        double grandTotal = 0;
        for (CartItem item : cartItems) {
            Food food = item.getFood();
            int quantity = item.getQuantity();
            grandTotal += food.getPrice() * quantity;
        }
        return grandTotal;
    }
}
