import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  final String orderNumber;

  const Order({super.key, required this.orderNumber});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmation'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 80.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: Text(
                  'Order #${widget.orderNumber} Confirmed!',
                  style: const TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text('Thank you for your order!'),
              const SizedBox(height: 10.0),
              const Text('Your order details:'),
              const Divider(thickness: 1.0),
              // Order details widget can be built here
              const OrderDetailsWidget(),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context), // Go back
                    child: const Text('Back to Home'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void trackOrder(BuildContext context) {
    // Implement your order tracking functionality here
    // You can show a progress indicator or navigate to a tracking page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Order tracking is not implemented yet.')),
    );
  }
}

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace this with your logic to display order details
    // You can iterate through a list of ordered items and display their names, quantities, prices, etc.
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Item 1: \$100.00'),
      ],
    );
  }
}
