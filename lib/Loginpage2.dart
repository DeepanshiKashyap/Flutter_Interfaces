import 'package:flutter/material.dart';
import 'package:sih_main_page/CreateAcc7Page.dart';
import 'package:sih_main_page/Forget3Page.dart';
import 'package:sih_main_page/Newfrnd8Page.dart';

class Loginpage2 extends StatelessWidget {
  const Loginpage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF), // Light greyish background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hey, Login Now!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'I am old user / ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAcc7Page(),));
                  }, child:const Text(
                    'Create New',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ), )
                ],
              ),
              const SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  hintText: 'Mobile Number',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Forget3Page(),));
                    }
                    , child:const Text(
                    'Forget Password / Reset',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ), ),


                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Newfrnd8Page(),));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue, // Button color
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Login Now',
                    style: TextStyle(fontSize: 18,color: Colors.black),


                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
