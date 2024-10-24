import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';
import 'package:pedometr/pages/welcome.dart';
import 'package:permission_handler/permission_handler.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        hintColor: const Color(0XFF233C63),
        fontFamily: 'Poppins',
      ),
      home: const Welcome(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Stream<StepCount> _stepCountStream;
//   late Stream<PedestrianStatus> _pedestrianStatusStream;
//   int _initialSteps = 0; // Store the initial step count
//   String _status = 'unknown';
//   String _steps = '0';
//   final double _stepLength = 0.78;
//   double _distance = 0.0; // To store distance

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   void onStepCount(StepCount event) {
//     print(event);
//     setState(() {
//       if (_initialSteps == 0) {
//         // Store the initial step count on the first event
//         _initialSteps = event.steps;
//       }
//       // Calculate steps relative to the initial steps
//       int currentSteps = event.steps - _initialSteps;
//       _steps = currentSteps.toString();
//       _distance = currentSteps * _stepLength / 1000; // Distance in kilometers
//     });
//   }

//   void onPedestrianStatusChanged(PedestrianStatus event) {
//     print(event);
//     setState(() {
//       _status = event.status;
//     });
//   }

//   void onPedestrianStatusError(error) {
//     print('onPedestrianStatusError: $error');
//     setState(() {
//       _status = 'Pedestrian Status not available';
//     });
//     print(_status);
//   }

//   void onStepCountError(error) {
//     print('onStepCountError: $error');
//     setState(() {
//       _steps = 'Step Count not available';
//     });
//   }

//   Future<bool> _checkActivityRecognitionPermission() async {
//     bool granted = await Permission.activityRecognition.isGranted;

//     if (!granted) {
//       granted = await Permission.activityRecognition.request() ==
//           PermissionStatus.granted;
//     }

//     return granted;
//   }

//   Future<void> initPlatformState() async {
//     bool granted = await _checkActivityRecognitionPermission();
//     if (!granted) {
//       // tell user, the app will not work
//     }

//     _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
//     (await _pedestrianStatusStream.listen(onPedestrianStatusChanged))
//         .onError(onPedestrianStatusError);

//     _stepCountStream = Pedometer.stepCountStream;
//     _stepCountStream.listen(onStepCount).onError(onStepCountError);

//     if (!mounted) return;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Pedometer Example'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Steps Taken',
//                 style: TextStyle(fontSize: 30),
//               ),
//               Text(
//                 _steps,
//                 style: TextStyle(fontSize: 60),
//               ),
//               Text('Distance: ${_distance.toStringAsFixed(2)} km'),
//               Divider(
//                 height: 100,
//                 thickness: 0,
//                 color: Colors.white,
//               ),
//               Text(
//                 'Pedestrian Status',
//                 style: TextStyle(fontSize: 30),
//               ),
//               Icon(
//                 _status == 'walking'
//                     ? Icons.directions_walk
//                     : _status == 'stopped'
//                         ? Icons.accessibility_new
//                         : Icons.error,
//                 size: 100,
//               ),
//               Center(
//                 child: Text(
//                   _status,
//                   style: _status == 'walking' || _status == 'stopped'
//                       ? TextStyle(fontSize: 30)
//                       : TextStyle(fontSize: 20, color: Colors.red),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
