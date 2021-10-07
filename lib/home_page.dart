import 'package:flutter/material.dart';

import 'app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              // currentAccountPicture: ClipRRect(
              //   borderRadius: BorderRadius.circular(40) ,
              currentAccountPicture: ClipOval(
                child: Image.network(
                  'https://avatars.githubusercontent.com/u/61249576?s=400&u=db5f018cf70eabdf7239945dda926bdfb8c9212b&v=4',
                ),
              ),
              accountName: Text('Guilherme'),
              accountEmail: Text('psiu@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              subtitle: Text('tela de inicio'),
              onTap: () {
                print('home');
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Sair'),
              subtitle: Text('Sair do app'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: [CustomSwitch()],
        title: Text("Home Page"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // vertical position
          // crossAxisAlignment: CrossAxisAlignment.start, // horizontal pros itens de dentro
          children: [
            Text('Contador: $counter'),
            CustomSwitch(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
