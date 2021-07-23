import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vocem/routes/pagination.dart';

import 'screens/screens_index.dart';

void main() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    'https://esp-proj.herokuapp.com/',
  );

  final AuthLink authLink = AuthLink(
    //getToken: () async => 'Bearer mytoken',
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );



  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(client: client,));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key, this.client}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  final ValueNotifier<GraphQLClient>  client;
  //final client;
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: widget.client,
      child: CacheProvider(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: Auth(),
        ),
      ),
    );
  }
}
