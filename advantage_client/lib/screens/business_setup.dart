import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants.dart';
import '../widgets/custom_button.dart';

class BusinessSetupScreen extends StatefulWidget {
  @override
  _BusinessSetupScreenState createState() => _BusinessSetupScreenState();
}

class _BusinessSetupScreenState extends State<BusinessSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  String businessName = '';
  String industry = '';
  String targetAudience = '';
  String budget = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Business Setup',
            style:
                GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Business Name',
                  style:
                      GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) => businessName = value,
              ),
              SizedBox(height: 20),
              Text('Industry',
                  style:
                      GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) => industry = value,
              ),
              SizedBox(height: 20),
              Text('Target Audience',
                  style:
                      GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) => targetAudience = value,
              ),
              SizedBox(height: 20),
              Text('Budget',
                  style:
                      GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) => budget = value,
              ),
              SizedBox(height: 30),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/dashboard');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
