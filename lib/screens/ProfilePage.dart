import 'package:flutter/material.dart';
import 'package:loginnn/login.dart';
import 'EditEmailScreen.dart';
import 'EditLocationScreen.dart';
import 'EditPhoneScreen.dart';// Import the EditEmailScreen

void main() {
  runApp(ProfilePage());
}


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.blue,

          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProfileBody(),
        ),
      ),
    );
  }
}


class ProfileBody extends StatelessWidget {
  Widget _buildEditButton(BuildContext context, String label, String value, IconData icon, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Text(
                  '$label:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background_image.jpg'), // Replace with your background image
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/profile_image.jpg'), // Replace with the path to your profile image
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'John Doe',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              'Front-end Developer',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildEditButton(context, 'Email', '', Icons.email, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditEmailScreen(),
                      ),
                    );
                  }),
                  _buildEditButton(context, 'Phone','', Icons.phone, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPhoneScreen(initialValue: '+91'),
                      ),
                    );
                    // Handle phone edit functionality
                  }),
                  _buildEditButton(context, 'Location', '', Icons.location_on, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditLocationScreen(initialValue: ''),
                      ),
                    );
                  }),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );// Logout functionality goes here
                        // For example: navigate to login screen or perform logout action
                      },
                      child: Text('Logout'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
