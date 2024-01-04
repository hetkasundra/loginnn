import 'package:flutter/material.dart';

import 'FindRideOffersPage.dart';

class RideDetailsPage extends StatelessWidget {
  final Ride selectedRide;

  RideDetailsPage({required this.selectedRide});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ride Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Driver: ${selectedRide.driverName}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    _buildDetailRow('From', selectedRide.departureLocation),
                    _buildDetailRow('To', selectedRide.destination),
                    _buildDetailRow(
                        'Departure Time', selectedRide.departureTime.toString()),
                    _buildDetailRow(
                        'Available Seats', selectedRide.availableSeats.toString()),
                    _buildDetailRow(
                        'Price per Seat', '\$${selectedRide.price.toStringAsFixed(2)}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
