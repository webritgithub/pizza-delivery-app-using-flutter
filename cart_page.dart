import 'package:flutter/material.dart';
import 'payment.dart';

class CartPage extends StatefulWidget {


  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String selectedBase = 'Thin Crust';
  List<String> selectedToppings = [];
  String description = '';

  final List<String> pizzaBases = ['Thin Crust', 'Freshly Pan Pizza', 'Classic Base'];
  final List<String> toppings = ['Extra Cheese', 'Extra Paneer', 'Extra Corns', 'Extra Mushrooms', 'Extra Chicken', 'Other Veggies'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red, 
        title: Text('Cart'),
      ),
      backgroundColor: Colors.black, 
      body: SingleChildScrollView( 
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Select Pizza Base:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white), // Set text color
              ),
              DropdownButton<String>(
                value: selectedBase,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBase = newValue!;
                  });
                },
                style: TextStyle(color: Colors.white, fontSize: 16.0), 
                dropdownColor: Colors.grey.shade900, 
                icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                items: pizzaBases.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.white)), 
                  );
                }).toList(),
              ),

              SizedBox(height: 20.0),
              Text(
                'Select Extra Toppings:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Wrap(
                children: toppings.map((topping) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilterChip(
                      label: Text(topping, style: TextStyle(color: Colors.white)),
                      selected: selectedToppings.contains(topping),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            selectedToppings.add(topping);
                          } else {
                            selectedToppings.remove(topping);
                          }
                        });
                      },
                      backgroundColor: Colors.grey, 
                      selectedColor: Colors.green, 
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                maxLines: null, 
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white), 
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white), 
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, 
                  onPrimary: Colors.white, 
                ),
                child: Text('Proceed to Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
