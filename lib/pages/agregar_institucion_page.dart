import 'package:flutter/material.dart';

class AgregarInstitucionPage extends StatelessWidget {
  const AgregarInstitucionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Agregar Institución'),
            ],
          ),
        ),
        body: _FormAgregar());
  }
}

class _FormAgregar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Nombre', border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Imagen de la Institución',
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
                width: 165,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Nivel Educativo',
                      hintText: '...',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                ),
              ),
              SizedBox(
                height: 50,
                width: 165,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Sector',
                      hintText: '...',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Cuidad',
                      hintText: '...',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text('Área o Especialidad'),
        ),
        _CheckBoxes(),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Dirección de la Institución',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Dirección de la Página Web',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
                width: 165,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Facebook',
                    hintText: '...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 165,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Instagram',
                    hintText: '...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
                width: 165,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Costo por inscripción',
                    hintText: '...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 165,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Costo por colegiatura',
                    hintText: '...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SizedBox(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Telefono',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Center(
          child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('Agregar'),
          elevation: 0,
        ))
      ],
    );
  }
}

class _CheckBoxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (_) {},
            ),
            Text('Artes'),
            Checkbox(
              value: false,
              onChanged: (_) {},
            ),
            Text('Ciencias'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (_) {},
            ),
            Text('Educación'),
            Checkbox(
              value: false,
              onChanged: (_) {},
            ),
            Text('Humanidades'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (_) {},
            ),
            Text('Ingenierias'),
          ],
        ),
      ],
    );
  }
}
