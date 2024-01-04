import 'package:flutter/material.dart';

class EditLocationScreen extends StatefulWidget {
  final String initialValue;

  EditLocationScreen({required this.initialValue});

  @override
  _EditLocationScreenState createState() => _EditLocationScreenState();
}

class _EditLocationScreenState extends State<EditLocationScreen> {
  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _locationController = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Location'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter new location:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to save the updated location
                String newLocation = _locationController.text;
                // You can add code here to update the location in your database or perform other actions
                Navigator.pop(context, newLocation); // Return the new location to the profile page
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
