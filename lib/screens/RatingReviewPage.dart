import 'package:flutter/material.dart';

void main() {
  runApp(RatingReviewPage());
}

class RatingReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Reviews'),
          backgroundColor: Colors.blue,

          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: RatingReviewForm(),
      ),
    );
  }
}

class RatingReviewForm extends StatefulWidget {
  @override
  _RatingReviewFormState createState() => _RatingReviewFormState();
}

class _RatingReviewFormState extends State<RatingReviewForm> {
  double _rating = 0.0;
  String _review = '';
  final FocusScopeNode _node = FocusScopeNode();
  bool _submitted = false;

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  void submitReview() {
    // Process the submitted review (e.g., send to backend, etc.)
    print('Rating: $_rating');
    print('Review: $_review');

    // Unfocus the text field and dismiss the keyboard
    _node.unfocus();

    setState(() {
      _submitted = true;
    });
  }

  void goToRatingReviewPage() {
    setState(() {
      _submitted = false;
    });
  }

  Widget _buildStar(int starCount) {
    return IconButton(
      icon: Icon(
        starCount <= _rating ? Icons.star : Icons.star_border,
        color: Colors.yellow,
        size: 40.0,
      ),
      onPressed: () {
        setState(() {
          _rating = starCount.toDouble();
        });
      },
    );
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildStar(1),
        _buildStar(2),
        _buildStar(3),
        _buildStar(4),
        _buildStar(5),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_submitted) {
          goToRatingReviewPage();
        }
      },
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: _submitted
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 50.0),
              SizedBox(height: 20.0),
              Text(
                'Thank you for your review!',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        )
            : FocusScope(
          node: _node,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rate this product',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              _buildStarRating(),
              SizedBox(height: 20.0),
              Text(
                'Write your review',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                maxLines: 4,
                onChanged: (value) {
                  setState(() {
                    _review = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Type your review here...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: submitReview,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
