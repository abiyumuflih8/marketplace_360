import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void main() {
  runApp(MarketplaceApp());
}

class MarketplaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace 360°',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Marketplace 360°')),
        actions: [
          IconButton(
            onPressed: () {
              // Add search functionality
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Kategori'),
              decoration: BoxDecoration(
                color: Colors.grey[850],
              ),
            ),
            ListTile(
              title: Text('Pakaian'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Elektronik'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Perabotan'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Olahraga'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Hobi'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Lainnya'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: ProductSection()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.login),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
    );
  }
}

class ProductSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductCard(
          name: 'Kaos Polos Hitam',
          details: 'Ukuran: M, L, XL\nBahan: Katun',
          price: 'Rp 50.000',
        ),
        ProductCard(
          name: 'Laptop Gaming',
          details: 'Merk: Asus\nSpesifikasi: Intel Core i7, 16 GB RAM, 512 GB SSD, Nvidia GeForce RTX 3060',
          price: 'Rp 15.000.000',
        ),
        ProductCard(
          name: 'Sofa Minimalis',
          details: 'Warna: Abu-abu\nDimensi: 200 x 80 x 60 cm',
          price: 'Rp 3.000.000',
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String details;
  final String price;

  ProductCard({required this.name, required this.details, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Placeholder(
              fallbackHeight: 300.0,
              color: Colors.grey,
            ),
            SizedBox(height: 10.0),
            Text(
              name,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 4.0),
            Text(
              details,
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 4.0),
            Text(
              price,
              style: TextStyle(fontSize: 16, color: Colors.orange),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Lihat 360°'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Coba VR'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PurchasePage(name: name, price: price)),
                    );
                  },
                  child: Text('Beli'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PurchasePage extends StatefulWidget {
  final String name;
  final String price;

  PurchasePage({required this.name, required this.price});

  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final TextEditingController _addressController = TextEditingController();
  String? _selectedPaymentMethod;
  
  void _showPinValidationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Masukkan PIN'),
          content: TextField(
            keyboardType: TextInputType.number,
            maxLength: 6,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'PIN 6 digit',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Pembayaran Berhasil'))
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembelian'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nota Pembayaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text('Nama Produk: ${widget.name}'),
            Text('Harga: ${widget.price}'),
            SizedBox(height: 20.0),
            Text(
              'Alamat Pengiriman',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: 'Masukkan alamat pengiriman',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Pilih Metode Pembayaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('360°Pay'),
              leading: Radio(
                value: '360°Pay',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Kartu Kredit'),
              leading: Radio(
                value: 'Kartu Kredit',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Kartu Debit'),
              leading: Radio(
                value: 'Kartu Debit',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Transfer ke Rekening'),
              leading: Radio(
                value: 'Transfer ke Rekening',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value.toString();
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_addressController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Masukkan alamat pengiriman'))
                    );
                  } else if (_selectedPaymentMethod == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Pilih metode pembayaran'))
                    );
                  } else {
                    _showPinValidationDialog();
                  }
                },
                child: Text('Bayar Sekarang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void _showRegistrationSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pendaftaran Berhasil'),
          content: Text('Akun Anda telah berhasil didaftarkan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Go back to the previous screen
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool _isPasswordValid(String password) {
    final passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$');
    return passwordRegExp.hasMatch(password);
  }

  void _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Handle the picked image
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login/Daftar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Nomor Telepon'),
            ),
            TextField(
              controller: _pinController,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'PIN 6 digit',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Minimal 8 karakter, harus ada huruf besar, angka, dan simbol',
              ),
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: _pickImage,
            ),
            ElevatedButton(
              onPressed: () {
                if (_emailController.text.isEmpty ||
                    _phoneController.text.isEmpty ||
                    _pinController.text.length != 6 ||
                    !_isPasswordValid(_passwordController.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Mohon lengkapi semua kolom dengan benar'))
                  );
                } else {
                  _showRegistrationSuccessDialog();
                }
              },
              child: Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}