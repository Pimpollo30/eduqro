import 'package:flutter/material.dart';

class NewsletterCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(width: 1, color: Colors.black)
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Text('Fecha')
              ),
            Positioned(
              top: 30,
              left: 10,
              child: Text('XXXXXXXXX')
              ),
            Positioned(
              top: 50,
              left: 10,
              child: Text('Asunto')
              ),
            Positioned(
              width: 300,
              top: 70,
              left: 10,
              child:Text('asasdfdf',)
              ),
            Positioned(
              top: 140,
              left: 190,
              child: Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  border: Border.all(color: Colors.black, width: 1,),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "editarNews");
                  },
                  icon: Icon(Icons.message_outlined))
              )
              ),
            Positioned(
              top: 140,
              left: 260,
              child: Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  border: Border.all(color: Colors.black, width: 1,),
                ),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline))
              )
              ),
          ],
        ),
      ),
    );
  }
}
