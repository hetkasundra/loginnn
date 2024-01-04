import 'package:flutter/material.dart';
import 'ViewRideRequestsPage.dart';

class PublishRidePage extends StatefulWidget {
  @override
  _PublishRidePageState createState() => _PublishRidePageState();
}

class _PublishRidePageState extends State<PublishRidePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _startingLocationController = TextEditingController();
  TextEditingController _endingLocationController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _seatsController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Publish Ride'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/map_image.jpg'),
            // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
          Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _startingLocationController,
                decoration: InputDecoration(labelText: 'Starting Location',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.7),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter starting location';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
                TextFormField(
                  controller: _endingLocationController,
                  decoration: InputDecoration(labelText: 'Ending Location',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter ending location';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.7),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a date';
                        }
                        if (!_isDateValid(value)) {
                          return 'Please enter a valid date \n(YYYY-MM-DD)';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _timeController,
                      decoration: InputDecoration(
                        labelText: 'Time',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.7),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a time';
                        }
                        if (!_isTimeValid(value)) {
                          return 'Please enter a valid time \n(HH:MM)';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _seatsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Available Seats',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter available seats';
                    }
                    if (int.tryParse(value) == null || int.parse(value) <= 0) {
                      return 'Please enter a valid number of seats';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Price per Seat',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter price per seat';
                    }
                    if (double.tryParse(value) == null || double.parse(value) <= 0) {
                      return 'Please enter a valid price';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),),

                ),
                SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                child: Text('Publish Ride'),
              ),
            ],
          ),
          ),
          ],
        ),
      ),
    );
  }
  bool _isDateValid(String date) {
    try {
      DateTime.parse(date);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool _isTimeValid(String time) {
    final pattern = RegExp(r'^([01]\d|2[0-3]):([0-5]\d)$');
    return pattern.hasMatch(time);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _publishRide();
    }
  }

  void _publishRide() {
    // Get values from controllers and perform actions to publish the ride
    // ...

    // Display a confirmation or success message
    _showConfirmationMessage();
  }

  void _showConfirmationMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ride Published'),
          content: Text('Your ride has been successfully published.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewRideRequestsPage()),
                );              },
              child: Text('View requested Rides'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Dispose controllers when the page is disposed to avoid memory leaks
    _startingLocationController.dispose();
    _endingLocationController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _seatsController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}