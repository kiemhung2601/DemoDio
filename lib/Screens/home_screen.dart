import 'package:demodio/Components/article_component.dart';
import 'package:demodio/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  Future<List<Article>> getUser() async{
    List<Article> articleList = [];
    try {
      var response = await Dio().get('https://testw-api.herokuapp.com/api/v1/articles');

      if(response.statusCode == 200){
        if(response.data['articles'] != null){
          for(int i = 0; i < response.data['articles'].length; i++){
              Article at = Article.fromDocument(response.data['articles'][i]);
              articleList.add(at);
          }            
        }
      }
      return articleList;
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: PreferredSize(     
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.menu),
          title: const Text(
            'Hello Dio Demo',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: '',
            ),
          ),
          actions: const [Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.notification_add),
          )],
          centerTitle: true,
          // flexibleSpace: Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.blueAccent, Colors.purple]),           
          //   ),
          // ),
        ),
      ),
      body: FutureBuilder<List<Article>>(
        future: getUser(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator());
          }else{
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (_,index){
                return Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 250, 250, 0.9),
                    //color: Colors.black12,
                    //color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: ArticleComponent(title: snapshot.data![index].title.toString(), image: 'https://media.istockphoto.com/photos/hot-air-balloons-flying-over-the-botan-canyon-in-turkey-picture-id1297349747', description: snapshot.data![index].description.toString(), subtitle: snapshot.data![index].url.toString())
              );            
              }
            );
          }
        }       
      ),            
    );
  }
}