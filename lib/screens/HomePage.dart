import 'package:flutter/material.dart';
import 'AboutUsPage.dart';
import 'FindRideOffersPage.dart';
import 'ProfilePage.dart';
import 'PublishRidePage.dart';
import 'RatingReviewPage.dart';
import 'ViewRideRequestsPage.dart';


class CarpoolingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carpooling App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carpooling'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );

            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Implement action for item 1 in the menu
                // Replace this with your logic
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Rating and Review'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RatingReviewPage()),
                );
              },
            ),
            // Add more ListTiles for additional menu items if needed
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/map_image.jpg', // Replace with your image asset path
            fit: BoxFit.cover,
          ),
          // Content of the screen
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  // This part holds your top 1/3rd screen area
                  color: Colors.transparent, // Make background transparent
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FindRideOffersPage()),
                          );
                          // Add functionality for the first button
                        },
                        child: Text('Find a Ride'),
                      ),
                      SizedBox(height: 16.0), // Add space between buttons
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PublishRidePage()),
                          );
                          // Add functionality for the second button
                        },
                        child: Text('Publish a Ride'),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  // This part holds the remaining screen area
                  color: Colors.transparent, // Change color as needed
                  // Add your remaining content here
                ),
              ),
            ],
          ),
        ],
      ),

    );

  }
}
