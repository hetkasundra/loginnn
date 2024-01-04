import 'package:flutter/material.dart';

class EditPhoneScreen extends StatefulWidget {
  final String initialValue;

  EditPhoneScreen({required this.initialValue});

  @override
  _EditPhoneScreenState createState() => _EditPhoneScreenState();
}

class _EditPhoneScreenState extends State<EditPhoneScreen> {
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Phone Number'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter new phone number:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Phone number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to save the updated phone number
                String newPhoneNumber = _phoneController.text;
                // You can add code here to update the phone number in your database or perform other actions
                Navigator.pop(context, newPhoneNumber); // Return the new phone number to the profile page
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
