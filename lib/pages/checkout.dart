import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final String coffeeItem;
  final int quantity;
  final String selectedSize;
  final String selectedSugar;

  const CheckoutPage({
    super.key,
    required this.coffeeItem,
    required this.quantity,
    required this.selectedSize,
    required this.selectedSugar,
  });

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isOrderPlaced = false; // Track button state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 252, 227),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 255, 252, 227),
        ),
        title: const Text(
          "Checkout",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 252, 227),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF3B7A30),
        elevation: 4,
        shadowColor: Colors.black26,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              shadowColor: Colors.black26,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Summary",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3B7A30),
                      ),
                    ),
                    const SizedBox(height: 6), // Reduced spacing
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSummaryRow("Item", widget.coffeeItem),
                        buildSummaryRow("Quantity", widget.quantity.toString()),
                        buildSummaryRow("Size", widget.selectedSize),
                        buildSummaryRow("Sugar", widget.selectedSugar),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Divider
            const Divider(
              thickness: 1.2,
              color: Colors.grey,
            ),
            const SizedBox(height: 8),

            // Total Price Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$XX.XX", // Replace with actual total calculation
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3B7A30),
                  ),
                ),
              ],
            ),

            const Spacer(),

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isOrderPlaced
                      ? null
                      : () {
                          setState(() {
                            isOrderPlaced = true;
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isOrderPlaced
                        ? const Color.fromARGB(255, 0, 0, 0)
                        : const Color(0xFF3B7A30),
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    shadowColor: const Color.fromARGB(96, 0, 0, 0),
                  ),
                  child: Text(
                    isOrderPlaced ? 'Order Placed' : 'Place Order',
                    style: TextStyle(
                      fontSize: 18,
                      color: isOrderPlaced
                          ? const Color(0xFF3B7A30)
                          : Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget buildSummaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2), // Tighter spacing
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title:",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(221, 0, 0, 0),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF3B7A30),
            ),
          ),
        ],
      ),
    );
  }
}
