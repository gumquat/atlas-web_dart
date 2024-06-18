import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    // Fetch user data as a JSON string
    final userDataJson = await fetchUserData();

    // Parse the JSON string into a Map
    final userData = jsonDecode(userDataJson);

    // Extract user ID from the fetched data
    final userId = userData['id'];

    // Fetch user orders as a JSON string
    final ordersJson = await fetchUserOrders(userId);
    final orders = jsonDecode(ordersJson).cast<String>();

    double total = 0;

    // Iterate over each order and calculate the total price
    for (final order in orders) {
      final productPriceJson = await fetchProductPrice(order);
      final productPrice = jsonDecode(productPriceJson);
      total += productPrice;
    }

    return total;
  } catch (e) {
    print('Error: $e');
    return -1;
  }
}