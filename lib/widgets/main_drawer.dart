import 'package:flutter/material.dart';
import '../screens/filterscreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: 200,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColorDark,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListItem("Meals", Icons.restaurant,(){
              Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListItem("Settings", Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FilterScreen.routesname);
          }),
        ],
      ),
    );
  }

  Widget buildListItem(String title,IconData iconData,VoidCallback tapHandler){
    return ListTile(
          leading: Icon(iconData,size: 26,),
          title:  Text(title,
              style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
          onTap: tapHandler,
        );
  }
}
