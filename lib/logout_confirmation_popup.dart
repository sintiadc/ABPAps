import 'package:flutter/material.dart';
import 'package:mealmate/main.dart';

class LogoutConfirmationPopup extends StatelessWidget {
  const LogoutConfirmationPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.warning, color: Colors.orange), // Icon peringatan
          SizedBox(width: 10),
          Text('Logout Confirmation'), // Judul popup
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Are you sure you want to logout? Once you logout you need to login again. Are you Ok?',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Image.asset(
            'img/picLogout2.png', // Gambar logout
            width: 100,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(
                false); // Mengembalikan nilai false saat tombol Cancel ditekan
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.red), // Warna teks merah
          ),
        ),
        TextButton(
          onPressed: () {
            // Mengembalikan nilai true saat tombol Logout ditekan
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const LandingPage(), // Navigasi ke halaman sign up
              ),
            );
          },
          child: Text(
            'Yes, Logout',
            style: TextStyle(color: Colors.green), // Warna teks hijau
          ),
        ),
      ],
    );
  }
}
