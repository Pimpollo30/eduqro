import 'package:flutter/material.dart';

class InstitucionesPage extends StatelessWidget {
  const InstitucionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            right:10,
            bottom: 10,
            child: FloatingActionButton(heroTag:"agregarInst",child:Icon(Icons.add),onPressed: () {
              Navigator.pushNamed(context, "agregarInst");
            },),
          ),
        ],
      ),
    );
  }
}