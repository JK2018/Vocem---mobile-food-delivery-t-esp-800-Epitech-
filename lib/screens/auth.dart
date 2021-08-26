import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vocem/api/speech_api.dart';
import 'package:vocem/custom_widgets/custom_widgets_index.dart';
import 'package:vocem/routes/pagination.dart';
import 'package:vocem/speechCmds.dart';

import '../global_vars.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String text = "";
  bool isListening = false;

  bool signInOrUp = true;
  String username;
  String password;
  TextEditingController usernameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  String readRepositories = """
    query users {
      users {
        id
        name
        rocket
        twitter
      }
    }
  """;

  String insertUser = """
      mutation login(\$username: String!, \$password: String!) {
        login(objects: {
          username: \$username,
          password: \$password,
        }) {
          returning {
            token
          }
        }
      }
    """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c2,
      //Colors.deepPurpleAccent,
      body:

      Mutation(
        options: MutationOptions(
          document: gql(insertUser), // this is the mutation string you just created
          // you can update the cache based on results
          update: (GraphQLDataProxy cache, QueryResult result) {
            return cache;
          },
          fetchPolicy: FetchPolicy.noCache,

          // or do something with the result.data on completion
          onCompleted: (dynamic resultData) {
            // Ici je pourrai checker la response du back
            print("response");
            print(resultData);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Pagination()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
        builder: (
            RunMutation runMutation,
            QueryResult result,
            ) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    runSpacing: 30,
                    alignment: WrapAlignment.center,
                    children: [
                      Text("Vocem",
                        style: TextStyle(color: c4,fontSize: 35, fontWeight: FontWeight.bold),),
                      Image.asset('assets/images/vocem_logo.png',width: 50,height: 50,),
                      InputCustom(
                        width: 300,
                        showText: false,
                        placeholder: "Email",
                        backgroundColor: c4, // Colors.white,
                        controller: usernameController,
                        keyboardType: TextInputType.text,
                      ),
                      InputCustom(
                        width: 300,
                        showText: false,
                        placeholder: "Password",
                        backgroundColor: c4, // Colors.white,
                        controller: pwdController,
                        keyboardType: TextInputType.text,
                      ),
                      signInOrUp ? BtnCustom(
                        width: 300,
                        textBtn: "Connexion",
                        iconName: Icons.person,
                        btnColor: c4, // Colors.white,
                        textColor: Colors.black,
                        onPress: () => {
                          signIn(),
                          runMutation({
                            'username': username,
                            'password': password,
                          })
                        },
                      ) : BtnCustom(
                        width: 300,
                        textBtn: "Inscription",
                        iconName: Icons.person,
                        btnColor: c4, // Colors.white,
                        textColor: Colors.black,
                        onPress: (){print("SignUp");},
                      ),
                      GestureDetector(
                        onTap: (){setState(() {
                          signInOrUp=!signInOrUp;
                        });},
                        child: signInOrUp ?
                        Text("Taper ici pour créer son compte",
                            style: TextStyle(color: c4,decoration: TextDecoration.underline)):
                        Text("Taper ici pour vous connectez",
                            style: TextStyle(color: c4,decoration: TextDecoration.underline)),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          );
        },
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: isListening,
          endRadius: 75,
          glowColor: c1,
          child: FloatingActionButton(
            child: Icon(isListening? Icons.mic : Icons.mic_none, size: 36),
            onPressed: toggleRecording,
          ),
        ),


      // FloatingActionButton(
      //   onPressed: () => runMutation({
      //     'name': 'Fab',
      //     'rocket': 'test',
      //     'twitter': '123',
      //   }),
      //   tooltip: 'Star',
      //   child: Icon(Icons.star),
      // );



      // TODO Query function
      //Query(
      //   options: QueryOptions(
      //     document: gql(readRepositories),
      //     // variables: {
      //     //   'nRepositories': 50,
      //     // },
      //     // pollInterval: Duration(seconds: 10),
      //   ),
      //   builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
      //     if (result.hasException) {
      //       return Text(result.exception.toString());
      //     }
      //
      //     if (result.isLoading) {
      //       return Text('Loading');
      //     }
      //
      //     // it can be either Map or List
      //     List users = result.data['users'];
      //
      //     print(users);
      //
      //     return ListView.builder(
      //         itemCount: users.length,
      //         itemBuilder: (context, index) {
      //           final user = users[index];
      //
      //           return Text(user['name']);
      //         });
      //   },
      // ),

    );
  }

  signIn(){
    setState(() {
      username=usernameController.text;
      password=pwdController.text;
    });
    print("SignIn");
    print(username);
    print(password);

  }

  Future toggleRecording()=> SpeechApi.toggleRecording(
    onResult: (text)=> setState(()=>this.text = text),
    onListening: (isListening) {
      setState(() => this.isListening=isListening);

      if(!isListening){
        Future.delayed(Duration(seconds: 1),(){
          List comText = Utils.scanText(text);
          if(comText[0].contains("username")) {
            setState(() => this.username = comText[1]);
          }
          if(comText[0].contains("password")) {
            setState(() => this.password = comText[1]);
          }
        });
      }
    }
  );




}
