import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  
  final bool isMale;
  final double height;
  final double weight;

  const BMIResult({
    super.key,
    required this.isMale,
    required this.weight,
    required this.height,
    });

  @override
  Widget build(BuildContext context) {
    double BMI = calculateBmi();
    String category = getCategory(BMI);

    return Scaffold(
      appBar: AppBar(title: Text('BMIResult:'),
      ),

      body: Center (
        child: Column(
          children: [
            Text('UR BMI RESULT IS: ${BMI.toStringAsFixed(1)}',
            style: TextStyle(fontSize: 24.0),
            ),

            SizedBox(height: 16.0),
            Text(
              'Category: $category',
              style: TextStyle(fontSize: 18.0),
            ),

            SizedBox(height: 16.0),
         // Add an icon based on the category
            getIcon(category),
          ],
        ),
      ),
    );
  }
  
  double calculateBmi() {
    return weight / ((height/100)*(height/100));
  }
  
  String getCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Kurus';
    } else if (bmi < 25.0) {
      return 'Normal';
    } else {
      return 'Gemuk';
    }
  }
  
  Widget getIcon(String category) {
    if (category == 'Slim') {
      return Icon(Icons.adjust, color: Colors.blue);
    } else if (category == 'Normal') {
      return Icon(Icons.sentiment_satisfied, color: Colors.green);
    } else {
      return Icon(Icons.warning, color: Colors.red);
    }
  }
}
