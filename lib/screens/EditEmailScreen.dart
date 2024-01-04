import 'package:flutter/material.dart';

class EditEmailScreen extends StatefulWidget {
  @override
  _EditEmailScreenState createState() => _EditEmailScreenState();
}

class _EditEmailScreenState extends State<EditEmailScreen> {
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch the user's current email and set it to the text field
    _emailController.text = ''; // Replace with actual user's email
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'New Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the updated email functionality
                String newEmail = _emailController.text;
                // Implement logic to update the user's email
                // For example, use a service or API call to update the email
                // Once done, you might want to navigate back to the profile page
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
