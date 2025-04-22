import 'package:flutter/material.dart';
 
 class NavigationSecond extends StatefulWidget {
   const NavigationSecond({super.key});
 
   @override
   State<NavigationSecond> createState() => _NavigationSecondState();
 }
 
 class _NavigationSecondState extends State<NavigationSecond> {
   @override
   Widget build(BuildContext context) {
     Color color;
     return Scaffold(
       appBar: AppBar(
         title: const Text('Navigation Second Screen Bayu'),
       ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             ElevatedButton(
               onPressed: () {
                 color = Colors.lime;
                 Navigator.pop(context, color);
               },
               child: const Text('Change to Lime'),
             ),
             ElevatedButton(
               onPressed: () {
                 color = Colors.deepOrange;
                 Navigator.pop(context, color);
               },
               child: const Text('Change to Deep Orage'),
             ),
             ElevatedButton(
               onPressed: () {
                 color = Colors.pink;
                 Navigator.pop(context, color);
               },
               child: const Text('Change to Pink'),
             ),
           ],
         ),
         
       ),
     );
   }
 }