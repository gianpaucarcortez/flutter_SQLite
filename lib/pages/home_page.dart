import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo3_sqflite/db/db_global.dart';

import 'package:flutter_codigo3_sqflite/widgets/dismissible_item_widget.dart';
import 'package:flutter_codigo3_sqflite/widgets/input_dialog_widget.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
    DBGlobalManager.db;
  }

  showAddModal(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Agregar Libro"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/images/add.svg',
                  height: 120,
                ),
                SizedBox(
                  height: 14,
                ),
                InputDialogWidget(
                  icon: Icons.book,
                  hint: "Libro",
                ),
                SizedBox(
                  height: 14,
                ),
                InputDialogWidget(
                  icon: Icons.person,
                  hint: "Autor",
                ),
                SizedBox(
                  height: 14,
                ),
                InputDialogWidget(
                  icon: Icons.image,
                  hint: "URL Portada",
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.black38),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Aceptar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          // Libro mantequilla = new Libro(
          //   id: 11,
          //   descripcionLibro: "The Lord",
          //   autor: "JRR Tolkien",
          //   urlImage:
          //       "http:www.google.com",
          // );
          // //DBGlobalManager.db.insertLibroRaw(matasquita);
          // DBGlobalManager.db.insertLibro(mantequilla);

          print(await DBGlobalManager.db.getAllLibros());
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff212121),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mis Libros",
                style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: 48.0,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.0),
              DismissibleItemWidget(),
              DismissibleItemWidget(),
              DismissibleItemWidget(),
              DismissibleItemWidget(),
              DismissibleItemWidget(),
              DismissibleItemWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
