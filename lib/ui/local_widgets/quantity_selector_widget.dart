import 'package:flutter/material.dart';
import 'package:flutter_cert_final/utils/app_colors.dart';

class QuantitySelector extends StatefulWidget {
  final ValueChanged<int> onQuantityChanged;

  const QuantitySelector({super.key, required this.onQuantityChanged});

  @override
  QuantitySelectorState createState() => QuantitySelectorState();
}

class QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
    widget.onQuantityChanged(quantity);
  }

  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
      widget.onQuantityChanged(quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'QTY',
            style: TextStyle(color: Colors.grey),
          ),
          Container(
            height: 24,
            width: 1,
            color: Colors.grey[300],
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _decreaseQuantity,
          ),
          Text(
            quantity.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.teal,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _increaseQuantity,
          ),
        ],
      ),
    );
  }
}
