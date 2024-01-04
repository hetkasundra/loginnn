import 'package:flutter/material.dart';

// Simulated ride request data model
class RideRequest {
  final String id;
  final String passengerName;
  final String pickupLocation;
  final String destination;
  final DateTime requestTime;
  final int numberOfPassengers;
  bool accepted; // Added a boolean field to track request status

  RideRequest({
    required this.id,
    required this.passengerName,
    required this.pickupLocation,
    required this.destination,
    required this.requestTime,
    required this.numberOfPassengers,
    this.accepted = false, // Default status is 'not accepted'
  });
}

class ViewRideRequestsPage extends StatefulWidget {
  @override
  _ViewRideRequestsPageState createState() => _ViewRideRequestsPageState();
}

class _ViewRideRequestsPageState extends State<ViewRideRequestsPage> {
  List<RideRequest> rideRequests = [
    RideRequest(
      id: '1',
      passengerName: 'Alice',
      pickupLocation: 'Home',
      destination: 'Office',
      requestTime: DateTime.now().subtract(Duration(minutes: 30)),
      numberOfPassengers: 1,
    ),
    RideRequest(
      id: '2',
      passengerName: 'Bob',
      pickupLocation: 'Work',
      destination: 'Gym',
      requestTime: DateTime.now().subtract(Duration(hours: 1)),
      numberOfPassengers: 2,
    ),
    RideRequest(
      id: '3',
      passengerName: 'Charlie',
      pickupLocation: 'School',
      destination: 'Park',
      requestTime: DateTime.now().subtract(Duration(minutes: 15)),
      numberOfPassengers: 1,
    ),
    RideRequest(
      id: '4',
      passengerName: 'David',
      pickupLocation: 'Airport',
      destination: 'Hotel',
      requestTime: DateTime.now().subtract(Duration(minutes: 45)),
      numberOfPassengers: 3,
    ),
    RideRequest(
      id: '5',
      passengerName: 'Emma',
      pickupLocation: 'Mall',
      destination: 'Restaurant',
      requestTime: DateTime.now().subtract(Duration(minutes: 10)),
      numberOfPassengers: 1,
    ),
    RideRequest(
      id: '6',
      passengerName: 'Frank',
      pickupLocation: 'Train Station',
      destination: 'Friend\'s House',
      requestTime: DateTime.now().subtract(Duration(hours: 2)),
      numberOfPassengers: 2,
    ),
// Add more ride requests in a similar manner

    // Add more simulated ride request data here
  ];

  List<RideRequest> filteredRequests = [];

  TextEditingController _filterController = TextEditingController();

  @override
  void initState() {
    filteredRequests = rideRequests;
    super.initState();
  }

  void _filterRequests(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredRequests = rideRequests
            .where((request) =>
            request.destination.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredRequests = rideRequests;
      }
    });
  }

  void _acceptRequest(int index) {
    setState(() {
      filteredRequests[index].accepted = true;
      // Perform other actions when the request is accepted
    });
  }

  void _rejectRequest(int index) {
    setState(() {
      // Perform actions when the request is rejected
      // For example, removing the request from the list
      filteredRequests.removeAt(index);
    });
  }

  void _cancelAcceptedRequest(int index) {
    setState(() {
      filteredRequests[index].accepted = false;
      // Perform other actions when the request is canceled
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requested Rides'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _filterController,
              onChanged: _filterRequests,
              decoration: InputDecoration(
                labelText: 'Filter by Destination',
                hintText: 'Enter destination...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRequests.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text('Passenger: ${filteredRequests[index].passengerName}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pickup Location: ${filteredRequests[index].pickupLocation}',
                        ),
                        Text(
                          'Destination: ${filteredRequests[index].destination}',
                        ),
                        Text(
                          'Requested Time: ${filteredRequests[index].requestTime.toString()}',
                        ),
                        Text(
                          'Number of Passengers: ${filteredRequests[index].numberOfPassengers}',
                        ),
                      ],
                    ),
                    trailing: filteredRequests[index].accepted
                        ? ElevatedButton.icon(
                      onPressed: () => _cancelAcceptedRequest(index),
                      icon: Icon(Icons.cancel),
                      label: Text('Cancel'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                      ),
                    )
                        : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton.icon(
                          onPressed: filteredRequests[index].accepted
                              ? null // Disable if already accepted
                              : () => _acceptRequest(index),
                          icon: Icon(Icons.check),
                          label: Text('Accept'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                    (states) => filteredRequests[index].accepted
                                    ? Colors.green.withOpacity(0.5)
                                    : Colors.green),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        ElevatedButton.icon(
                          onPressed: filteredRequests[index].accepted
                              ? null // Disable if already accepted
                              : () => _rejectRequest(index),
                          icon: Icon(Icons.close),
                          label: Text('Reject'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                    (states) => filteredRequests[index].accepted
                                    ? Colors.red.withOpacity(0.5)
                                    : Colors.red),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Implement action when tapping the request item
                      // For example, navigate to a detailed request page
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Ride Requests',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ViewRideRequestsPage(),
    );
  }
}
