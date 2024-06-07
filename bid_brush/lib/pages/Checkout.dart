import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:bidbrush/pages/order.dart';

import 'order.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key, required this.totalAmount});

  final double totalAmount;

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _contact = "";
  String _address = "";
  String _street = "";
  String _landmark = "";
  String _pincode = "";
  String _cardNumber = "";
  String _cvv = "";
  String _cardName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Billing Information Section (Title)
                const Text(
                  'Billing Information',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),

                // Billing Information Fields
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() => _name = value!),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Contact',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your contact number';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() => _contact = value!),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() => _address = value!),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Street',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your street';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() => _street = value!),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Landmark',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your landmark';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() => _landmark = value!),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Pincode',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your pincode';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() => _pincode = value!),
                ),

                // Payment Information Section (Title)
                const SizedBox(height: 20.0),
                const Text(
                  'Payment Information',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),

                // Single card number field
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Card Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your card number';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() => _cardNumber = value!),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Card CVV',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your card CVV';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() => _cvv = value!),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name on Card',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the name on your card';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() => _cardName = value!),
                ),

                // Order Summary Section
                const SizedBox(height: 20.0),
                const Text(
                  'Order Summary',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Text('Total: \$​​${widget.totalAmount.toStringAsFixed(2)}'),

                // Place Order Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Get.to(const Order(
                        orderNumber: '1',
                      ));
                      // Call function to process payment and submit order (replace with your logic)
                    }
                  },
                  child: const Text('Place Order'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}