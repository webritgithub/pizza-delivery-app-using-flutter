import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  TextEditingController _billingAddressController = TextEditingController();
  TextEditingController _promoCodeController = TextEditingController();
  String _paymentMethod = 'Card';
  double _totalAmount = 100.0;
  double _discountedAmount = 0.0;
  bool _isTracking = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Payment'),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Select Payment Method:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              ListTile(
                title: Text('Credit/Debit Card', style: TextStyle(color: Colors.white)),
                leading: Radio(
                  value: 'Card',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value!;
                    });
                  },
                  activeColor: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('Cash on Delivery', style: TextStyle(color: Colors.white)),
                leading: Radio(
                  value: 'COD',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value!;
                    });
                  },
                  activeColor: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('UPI', style: TextStyle(color: Colors.white)),
                leading: Radio(
                  value: 'UPI',
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value!;
                    });
                  },
                  activeColor: Colors.orange,
                ),
              ),
              SizedBox(height: 20.0),
              if (_paymentMethod == 'Card') ...[
                Text(
                  'Enter Payment Details:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                TextFormField(
                  controller: _cardNumberController,
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                TextFormField(
                  controller: _expiryDateController,
                  decoration: InputDecoration(
                    labelText: 'Expiry Date (MM/YY)',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                TextFormField(
                  controller: _cvvController,
                  decoration: InputDecoration(
                    labelText: 'CVV',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                ),
                TextFormField(
                  controller: _billingAddressController,
                  decoration: InputDecoration(
                    labelText: 'Billing Address',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ] else if (_paymentMethod == 'UPI') ...[
                Text(
                  'Make UPI Payment:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                TextFormField(
                  controller: _billingAddressController,
                  decoration: InputDecoration(
                    labelText: 'UPI ID',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ],
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  bool paymentSuccessful = _processPayment();
                  if (paymentSuccessful) {
                    _trackPizzaOrder();
                    setState(() {
                      _isTracking = true;
                    });
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Payment failed. Please try again.')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                ),
                child: Text('Proceed'),
              ),
              SizedBox(height: 20.0),
              if (_isTracking) TrackingMessage(),
            ],
          ),
        ),
      ),
    );
  }

  bool _processPayment() {
    String promoCode = _promoCodeController.text;
    if (promoCode.isNotEmpty) {
      if (promoCode == 'DISCOUNT20') {
        _discountedAmount = _totalAmount * 0.2;
        _totalAmount -= _discountedAmount;
      } else if (promoCode == 'SALE50') {
        _discountedAmount = 50.0;
        _totalAmount -= _discountedAmount;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid promo code. Please try again.')),
        );
        return false;
      }
    }
    return true;
  }

  void _trackPizzaOrder() {
    print('Tracking pizza order...');
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _billingAddressController.dispose();
    _promoCodeController.dispose();
    super.dispose();
  }
}

class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  double _rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        title: Text('Payment Success'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Thank you for ordering from CrazyPizzy!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_pizza,
                  color: Colors.orange,
                  size: 24.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Your delicious pizza is being cooked!!',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.food_bank,
                  color: Colors.orange,
                  size: 24.0,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()), 
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              child: Text('Back to Cart'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                _showReviewDialog(context); 
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              child: Text('Leave a Review'),
            ),
          ],
        ),
      ),
    );
  }

  void _showReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Leave a Review'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Enter your review'),
              ),
              SizedBox(height: 10.0),
              Text('Rating:'),
              SizedBox(height: 10.0),
              RatingBar.builder(
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

class TrackingMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.local_pizza,
            color: Colors.orange,
            size: 24.0,
          ),
          SizedBox(width: 8.0),
          Text(
            'Your pizza is being tracked...',
            style: TextStyle(color: Colors.orange, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
