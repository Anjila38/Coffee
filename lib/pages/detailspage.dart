
import 'package:flutter/material.dart';

import 'checkout.dart';

class Details extends StatefulWidget {
  const Details({
    super.key,
    required this.coffeeItem,
    required this.imageDetail,
  });

  final String coffeeItem;
  final String imageDetail;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int quantity = 1;
  String selectedSize = 'Small';
  String selectedSugar = '1 Cube';

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  Widget buildSizeButton(String size) {
    bool isSelected = selectedSize == size;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected
            ? const Color.fromARGB(255, 255, 252, 227)
            : const Color.fromARGB(255, 59, 122, 48),
        side: BorderSide(
          color: isSelected
              ? Colors.transparent
              : const Color.fromARGB(255, 208, 255, 0),
        ),
      ),
      onPressed: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Text(
        size,
        style: TextStyle(
          color: isSelected
              ? const Color.fromARGB(255, 59, 122, 48)
              : const Color.fromARGB(255, 255, 252, 227),
        ),
      ),
    );
  }

  Widget buildSugarButton(String sugar) {
    bool isSelected = selectedSugar == sugar;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected
            ? const Color.fromARGB(255, 255, 252, 227)
            : const Color.fromARGB(255, 59, 122, 48),
        side: BorderSide(
          color:isSelected
              ? Colors.transparent
              : const Color.fromARGB(255, 208, 255, 0),
        ),
      ),
      onPressed: () {
        setState(() {
          selectedSugar = sugar;
        });
      },
      child: Text(
        sugar,
        style: TextStyle(
          color: isSelected
              ? const Color.fromARGB(255, 59, 122, 48)
              : const Color.fromARGB(255, 255, 252, 227),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 59, 122, 48),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 252, 227),
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 59, 122, 48)),
        title: Text(
          widget.coffeeItem,
          style: const TextStyle(
            color: Color.fromARGB(255, 59, 122, 48),
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: const Color.fromARGB(255, 255, 252, 227),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(207, 0, 26, 0),
                      blurRadius: 10,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                height: 150,
                width: double.infinity,
                child: Image.asset(widget.imageDetail),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.coffeeItem,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 208, 255, 0),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '\$25',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 252, 227),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: decrement,
                          icon: const Icon(Icons.remove),
                          color: Colors.white,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: const BoxDecoration(
                            border: Border.symmetric(
                              vertical: BorderSide(
                                  color: Color.fromARGB(255, 255, 252, 227)),
                            ),
                          ),
                          child: Text(
                            quantity.toString(),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 252, 227)),
                          ),
                        ),
                        IconButton(
                          onPressed: increment,
                          icon: const Icon(Icons.add),
                          color: const Color.fromARGB(255, 255, 252, 227),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Size',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 208, 255, 0),
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSizeButton('Small'),
                      buildSizeButton('Medium'),
                      buildSizeButton('Large'),
                    ],
                  ),
                ],
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sugar (In Cubes)',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 208, 255, 0),
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    // spacing: 1,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSugarButton('1'),
                      buildSugarButton('2'),
                      buildSugarButton('3'),
                      buildSugarButton('4'),
                    ],
                  ),
                ],
              ),
              Divider(
                height: 0.1,
                color: const Color.fromARGB(255, 255, 252, 227),
              ),
              Center(
                child: TextButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    backgroundColor: const Color.fromARGB(255, 208, 255, 0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CheckoutPage(
                            coffeeItem: widget.coffeeItem,
                            quantity: quantity,
                            selectedSize: selectedSize,
                            selectedSugar: selectedSugar,
                          );
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Proceed To Checkout',
                    style: TextStyle(color: Color.fromARGB(255, 59, 122, 48)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
