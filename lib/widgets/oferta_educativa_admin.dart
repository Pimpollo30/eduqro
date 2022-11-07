import 'package:flutter/material.dart';

class OfertaEducativaAdminCard extends StatelessWidget {
  const OfertaEducativaAdminCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Nombre de la carrera",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Propósito del programa educativo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Quis ipsum consequat et eiusmod culpa enim deserunt exercitation amet cupidatat non. Aute ex ipsum nisi occaecat ea elit anim magna do ad et. Pariatur in fugiat cupidatat magna veniam cillum do et tempor excepteur aute. Occaecat nisi excepteur nisi esse amet labore ad voluptate et nostrud magna voluptate sint esse. Ipsum consectetur exercitation culpa id enim.",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Programa académico",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Sit culpa et aute excepteur pariatur eu proident cupidatat cillum. Sunt voluptate est veniam sunt non ad labore ipsum duis nulla cupidatat aliqua. Est aliqua esse fugiat minim mollit proident irure eiusmod tempor proident consectetur adipisicing anim non. Eu sint ut laboris nulla magna amet ullamco dolor voluptate pariatur aliqua.",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "editarOferta");
                  },
                  icon: Icon(Icons.edit)),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(width:10),
            Container(
              child: IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline)),
                  decoration: BoxDecoration(
                    color:Colors.grey.shade300,
                    border: Border.all(color:Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10)),)
          ],
        )),
      ]),
    );
  }
}
