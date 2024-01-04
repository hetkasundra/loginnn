import 'package:flutter/material.dart';

import 'RideDetailsPage.dart';

// Simulated ride data model
class Ride {
  final String id;
  final String driverName;
  final String departureLocation;
  final String destination;
  final DateTime departureTime;
  final int availableSeats;
  final double price;

  Ride({
    required this.id,
    required this.driverName,
    required this.departureLocation,
    required this.destination,
    required this.departureTime,
    required this.availableSeats,
    required this.price,
  });
}

class FindRideOffersPage extends StatefulWidget {
  @override
  _FindRideOffersPageState createState() => _FindRideOffersPageState();
}

class _FindRideOffersPageState extends State<FindRideOffersPage> {
  List<Ride> rideOffers = [
    Ride(
      id: '1',
      driverName: 'John Doe',
      departureLocation: 'City A',
      destination: 'City B',
      departureTime: DateTime.now().add(Duration(days: 1)),
      availableSeats: 3,
      price: 20.0,
    ),
    Ride(
      id: '1',
      driverName: 'John Doe',
      departureLocation: 'City A',
      destination: 'City C',
      departureTime: DateTime.now().add(Duration(days: 1)),
      availableSeats: 3,
      price: 20.0,
    ),
    Ride(
      id: '1',
      driverName: 'John Doe',
      departureLocation: 'City A',
      destination: 'City D',
      departureTime: DateTime.now().add(Duration(days: 1)),
      availableSeats: 3,
      price: 20.0,
    ),
    Ride(
      id: '1',
      driverName: 'John Doe',
      departureLocation: 'City A',
      destination: 'City C',
      departureTime: DateTime.now().add(Duration(days: 1)),
      availableSeats: 3,
      price: 15.0,
    ),
    Ride(
      id: '1',
      driverName: 'John Doe',
      departureLocation: 'City A',
      destination: 'City D',
      departureTime: DateTime.now().add(Duration(days: 1)),
      availableSeats: 3,
      price: 10.0,
    ),Ride(
      id: '1',
      driverName: 'John Doe',
      departureLocation: 'City A',
      destination: 'City B',
      departureTime: DateTime.now().add(Duration(days: 1)),
      availableSeats: 3,
      price: 20.0,
    ),


    // Add more simulated ride data here
  ];

  List<Ride> filteredRides = []; // For search results

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    filteredRides = rideOffers;
    super.initState();
  }

  void _navigateToRideDetails(Ride selectedRide) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RideDetailsPage(selectedRide: selectedRide),
      ),
    );
  }


  void _filterRides(String query) {
    setState(() {
      filteredRides = rideOffers
          .where((ride) =>
          ride.destination.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _sortRidesByPrice(bool ascending) {
    setState(() {
      filteredRides.sort((a, b) {
        if (ascending) {
          return a.price.compareTo(b.price);
        } else {
          return b.price.compareTo(a.price);
        }
      });
    });
  }

  Future<void> _selectDestination(BuildContext context) async {
    List<String> availableDestinations = rideOffers
        .map((ride) => ride.destination)
        .toSet() // Get unique destinations
        .toList();

    String? selectedDestination = await showDialog<String>(
      context: context,
      builder: (BuildContext dialogContext) {
        return SimpleDialog(
          title: Text('Select Destination'),
          children: availableDestinations.map((destination) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(dialogContext, destination);
              },
              child: Text(destination),
            );
          }).toList(),
        );
      },
    );

    if (selectedDestination != null) {
      _searchController.text = selectedDestination;
      _filterRides(selectedDestination);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: _filterRides,
          decoration: InputDecoration(
            hintText: 'Search destination...',
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.place),
            onPressed: () {
              _selectDestination(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              _sortRidesByPrice(true); // Set to true for ascending order
            },
          ),
        ],
      ),

      body:
      Stack(
        fit: StackFit.expand,
        children: [
        // Background image widget
        Image.asset(
        'assets/map_image.jpg',
        fit: BoxFit.cover,
      ),
      ListView.builder(
        itemCount: filteredRides.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _navigateToRideDetails(filteredRides[index]);
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                title: Text(filteredRides[index].driverName),
                subtitle: Text(
                  '${filteredRides[index].departureLocation} to ${filteredRides[index].destination}\n'
                      'Departure Time: ${filteredRides[index].departureTime.toString()}\n'
                      'Seats Available: ${filteredRides[index].availableSeats}\n'
                      'Price: \$${filteredRides[index].price.toStringAsFixed(2)}',
                ),
              ),
            ),
          );
        },
      ),
      ],
      ),

    );
  }
}
