import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'account_creation_page.dart';

class Promotion {
  final String title;
  final String description;
  final String code;

  Promotion({
    required this.title,
    required this.description,
    required this.code,
  });
}

List<Promotion> promotions = [
  Promotion(
    title: 'Special Offer',
    description: 'Get 20% off on all orders.',
    code: 'SPCL20',
  ),
  Promotion(
    title: 'Weekend Deal',
    description: 'Buy 1 Get 1 Free on pizzas.',
    code: 'WEEKENDBOGO',
  ),
  // Add more promotions as needed...
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crazy Pizzy',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), 
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()), 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your image here
            Image.network(
              'https://image.spreadshirtmedia.com/image-server/v1/compositions/T1186A2PA3066PT17X29Y28D1044678185W13429H13429/views/1,width=550,height=550,appearanceId=2,backgroundColor=000000,noPt=true/pizza-logo-apron.jpg',
              width: 150, // Adjust width as needed
              height: 150, // Adjust height as needed
            ),
            SizedBox(height: 20),
            // Add your text here
            Text(
              'Crazy Pizzy',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator( 
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isObscure = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        title: Text('Sign In'),
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(90.0),
              child: Image.network(
                'https://image.spreadshirtmedia.com/image-server/v1/compositions/T1186A2PA3066PT17X29Y28D1044678185W13429H13429/views/1,width=550,height=550,appearanceId=2,backgroundColor=000000,noPt=true/pizza-logo-apron.jpg',
                width: 100.0,
                height: 100.0,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.email, color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              obscureText: _isObscure, 
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off, 
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure; 
                    });
                  },
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocationPage()), 
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
              child: Text('Sign In'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                // Navigate to the account creation page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountCreationPage()),
                );
              },
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('Create an Account'),
            ),
          ],
        ),
      ),
    );
  }
}


class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  TextEditingController _addressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        title: Text('Enter Your Location'),
      ),
      backgroundColor: Colors.black, 
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _addressController,
              style: TextStyle(color: Colors.white), 
              decoration: InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(color: Colors.white), 
                border: OutlineInputBorder( // Add border styling
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _cityController,
              style: TextStyle(color: Colors.white), 
              decoration: InputDecoration(
                labelText: 'City',
                labelStyle: TextStyle(color: Colors.white), 
                border: OutlineInputBorder( // Add border styling
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _countryController,
              style: TextStyle(color: Colors.white), 
              decoration: InputDecoration(
                labelText: 'Country',
                labelStyle: TextStyle(color: Colors.white), 
                border: OutlineInputBorder( 
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
               
                String address = _addressController.text;
                String city = _cityController.text;
                String country = _countryController.text;

              
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PizzaPage()), 
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, 
                onPrimary: Colors.white, 
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    super.dispose();
  }
}




class PizzaPage extends StatefulWidget {
  @override
  _PizzaPageState createState() => _PizzaPageState();
}

class _PizzaPageState extends State<PizzaPage> {
  bool _showVegPizzas = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        title: Text(
          'Crazy Pizzy',
          style: TextStyle(
            fontSize: 24, // Adjust the font size as needed
            fontWeight: FontWeight.bold, // Apply bold font weight
            letterSpacing: 1.2, // Adjust the letter spacing
            color: Colors.black, // Set the text color
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()), 
              );
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white, // Set the icon color to white
            ), // Add shopping cart icon
            tooltip: 'View Cart', 
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _showVegPizzas = false; 
              });
            },
            icon: Icon(
              Icons.local_pizza, 
              color: _showVegPizzas ? Colors.grey : Colors.brown.shade900,
            ),
            tooltip: 'Non-Veg',
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _showVegPizzas = true; 
              });
            },
            icon: Icon(
              Icons.local_pizza, 
              color: _showVegPizzas ? Colors.green : Colors.grey,
            ),
            tooltip: 'Veg',
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: _showVegPizzas ? _buildPizzaList(true) : _buildPizzaList(false),
      ),
    );
  }

  List<Widget> _buildPizzaList(bool isVeg) {
    List<PizzaItem> pizzas = [
      PizzaItem(
        name: 'Margherita',
        description: 'Classic cheese and tomato base',
        price: 'Rs 99',
        imageUrl: 'https://www.dominos.co.in/blog/wp-content/uploads/2019/12/A-Delicious-History-of-Your-Favourite-Classic-Margherita-Pizza.png',
        isVeg: true,
      ),
      PizzaItem(
        name: 'Mushroom Pizza',
        description: 'Peppy Mushrroms with capsicum',
        price: 'Rs 200',
        imageUrl: 'https://lh3.googleusercontent.com/PRWnZ6hTQ2hCckrOO4BlZdnxLSlHeECYm_nfmj9H1Gke1rr94WBBSvtmsshceupMadhNAJyjxJcJxmsnO_pJrlLDtLTa8lfud8fDc5w=w512-rw',
        isVeg: true,
      ),
      PizzaItem(
        name: 'Cheese n Corn Pizza',
        description: 'Mozzarella cheese with golden corns',
        price: 'Rs 169',
        imageUrl: 'https://storage.googleapis.com/shy-pub/285347/1683898758033_SKU-0672_0.jpg',
        isVeg: true,
      ),
      PizzaItem(
        name: 'Double Cheese Margherita Pizza',
        description: 'Double cheese and tomato base',
        price: 'Rs 189',
        imageUrl: 'https://www.pizzabank.in/wp-content/uploads/2023/11/Double-Cheese-Margherita.jpeg',
        isVeg: true,
      ),
      PizzaItem(
        name: 'Paneer Makhani Pizza',
        description: 'Makhani panner coated with makhani sauce',
        price: 'Rs 249',
        imageUrl: 'https://pizzavalley.in/wp-content/uploads/2023/07/Paneer_Makhani.webp',
        isVeg: true,
      ),
      PizzaItem(
        name: 'Crazy Pizzy Special',
        description: 'Double cheese with exotic veggies and herbs',
        price: 'Rs 249',
        imageUrl: 'https://lh3.googleusercontent.com/PRWnZ6hTQ2hCckrOO4BlZdnxLSlHeECYm_nfmj9H1Gke1rr94WBBSvtmsshceupMadhNAJyjxJcJxmsnO_pJrlLDtLTa8lfud8fDc5w=w512-rw',
        isVeg: true,
      ),
      PizzaItem(
        name: 'Farmhouse Pizza',
        description: 'Freshly farmhouse veggies',
        price: 'Rs 229',
        imageUrl: 'https://storage.googleapis.com/shy-pub/285347/1685038567422_SKU-0734_0.jpg',
        isVeg: true,
      ),
      PizzaItem(
        name: 'Chicken Pepperoni',
        description: 'Spicy pepperoni with mozzarella',
        price: 'Rs 300',
        imageUrl: 'https://www.pizzacorner.com.my/wp-content/uploads/2021/06/Chicken-Pepperoni.png',
        isVeg: false,
      ),
      PizzaItem(
        name: 'Pepper Barbecue Chicken Pizza',
        description: 'Spicy pepperoni with mozzarella',
        price: 'Rs 229',
        imageUrl: 'https://img.cdnx.in/99675/1635702780374_SKU-0101_0.webp?width=600',
        isVeg: false,
      ),
      PizzaItem(
        name: 'Chicken Sausage Pizza',
        description: 'Spicy pepperoni with mozzarella',
        price: 'Rs 189',
        imageUrl: 'https://img.cdnx.in/99675/1635623551432_SKU-0064_0.webp?width=600',
        isVeg: false,
      ),
      PizzaItem(
        name: 'Non Veg Supreme Pizza',
        description: 'Spicy pepperoni with mozzarella',
        price: 'Rs 319',
        imageUrl: 'https://static.toiimg.com/thumb/53339084.cms?width=1200&height=900',
        isVeg: false,
      ),
      PizzaItem(
        name: 'Indi Chicken Tikka Pizza',
        description: 'Spicy pepperoni with mozzarella',
        price: 'Rs 319',
        imageUrl: 'https://media.istockphoto.com/id/1340589333/photo/homemade-indian-chicken-tikka-masala-pizza.jpg?s=612x612&w=0&k=20&c=QetWD3UJeCFoTq6OYNJehauw7Utc8MxH6B90Cb9zvLw=',
        isVeg: false,
      ),
      PizzaItem(
        name: 'Chicken Dominator Pizza',
        description: 'Spicy pepperoni with mozzarella',
        price: 'Rs 319',
        imageUrl: 'https://www.dominos.co.in/files/items/chicken_feast.jpg',
        isVeg: false,
      ),
      // Add more pizza items as needed...
    ];

    // Filter pizzas based on whether to show veg or non-veg pizzas
    List<PizzaItem> filteredPizzas =
    pizzas.where((pizza) => pizza.isVeg == isVeg).toList();

    // Create a list of widgets to display the pizzas
    List<Widget> pizzaWidgets = filteredPizzas
        .map((pizza) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: PizzaItem(
        name: pizza.name,
        description: pizza.description,
        price: pizza.price,
        imageUrl: pizza.imageUrl,
        isVeg: true, // Assuming this pizza is vegetarian
      ),
    ))
        .toList();

    return pizzaWidgets;
  }
}

class PizzaItem extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String imageUrl;
  final bool isVeg;

  PizzaItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isVeg,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      color: Colors.brown.shade900,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Image.network(
              imageUrl,
              width: 350, // Adjust width as needed
              height: 150, // Adjust height as needed
              fit: BoxFit.cover, // Adjust the image fit as needed
            ),
            SizedBox(height: 10.0),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Price: $price',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
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
              child: Text('Add to Cart'),
            ),

            // Display promotions and discounts here
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  'Promotions and Discounts:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 5),
                // Display the list of promotions and discounts
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: promotions.map((promo) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '${promo.title}: ${promo.description} (Code: ${promo.code})',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
