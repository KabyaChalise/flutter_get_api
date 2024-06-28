import 'package:flutter/material.dart';
import 'package:flutter_get_api/modals/user_modals.dart';
import 'package:flutter_get_api/service/get_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModals> userModals = [];

  getUsers() {
    GetService().getUsers().then((value) {
      setState(() {
        userModals = value!;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: userModals.length,
            itemBuilder: (context, index) {
              final apiData = userModals[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 5,
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(7),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white
                            ),
                            child: Center(
                              child: Text(apiData.id.toString(),style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  apiData.title,
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Text(apiData.body),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
