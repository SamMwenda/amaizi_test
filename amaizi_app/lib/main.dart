import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'Models/user.dart';
import 'Services/userservice.dart';
import 'Widget/displayname.dart';

void main() {
  // Easily access the UserService
  GetIt.I.registerLazySingleton(() => UserService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserService get serviceUser => GetIt.I<UserService>();
  late Future<List<User>> apiresponse;

  @override
  void initState() {
    super.initState();
    //make a get request to api
    apiresponse = serviceUser.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height:200),
            FutureBuilder<List<User>>(
              future: apiresponse,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Flexible(
                    child: ListView.separated(
                      itemCount: snapshot.data!.length,
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (context, index) {
                          return DisplayName(snapshot.data![index]);
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
