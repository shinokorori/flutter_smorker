import 'package:flutter/material.dart';
import '../models/user_data.dart';

class InitialSetupPage extends StatefulWidget {
  @override
  _InitialSetupPageState createState() => _InitialSetupPageState();
}

class _InitialSetupPageState extends State<InitialSetupPage> {
  final _formKey = GlobalKey<FormState>();
  final _cigarettesPerDayController = TextEditingController();
  final _pricePerPackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('喫煙状況の設定')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _cigarettesPerDayController,
                decoration: InputDecoration(labelText: '１日あたりの本数'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pricePerPackController,
                decoration: InputDecoration(labelText: '１箱あたりの値段'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '入力してください';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    UserData().cigarettesPerDay = int.parse(_cigarettesPerDayController.text);
                    UserData().pricePerPack = int.parse(_pricePerPackController.text);
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  }
                },
                child: Text('設定完了'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cigarettesPerDayController.dispose();
    _pricePerPackController.dispose();
    super.dispose();
  }
}
