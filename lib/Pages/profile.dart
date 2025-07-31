import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.50, -0.7),
              end: Alignment(0.50, 1.00),
              colors: [
                Color(0xFF525832),
                Color(0xFF282A18),
                Color(0xFF1D1D1D),
              ],
            ),
          ),
          child: const _MyProfile(),
        ),
      ),
    );
  }
}

class _MyProfile extends StatefulWidget {
  const _MyProfile();

  @override
  State<_MyProfile> createState() => _MyProfileState();
}







class _MyProfileState extends State<_MyProfile> {

  final String fullName = 'John Doe';
  final String username = 'johndoe123';
  final String phone = '9876543210';
  final String email = 'johndoe@example.com';
  final String age = '22';
  final int eventsHosted = 5;
  final int bookings = 3;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/avatar.png'), // optional
                ),
                const SizedBox(height: 16),
                Text(
                  fullName,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                _buildInfoTile('Username', username),
                _buildInfoTile('Phone Number', phone),
                _buildInfoTile('Email', email),
                _buildInfoTile('Age', age),
                _buildInfoTile('Events Hosted', eventsHosted.toString()),
                _buildInfoTile('My Bookings', bookings.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(value),
    );
  }
}

