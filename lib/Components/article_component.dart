import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ArticleComponent extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String subtitle;

  const ArticleComponent({ Key? key, required this.title, required this.image, required this.description, required this.subtitle, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 400,
          height: 300,
          child: Container(        
            decoration: const BoxDecoration(
              // color: Color.fromRGBO(255, 179, 102, 0.7),
               color: Color.fromRGBO(255, 250, 250, 0.5),
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: Padding(           
              padding: const EdgeInsets.all(4.0),
              child: Column(             
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,               
                children: <Widget>[
                  Flexible(
                    flex: 5,
                    child: Row(                   
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width:200,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(image),
                            ),
                          ),
                        ),
                        ElevatedButton(                       
                          onPressed: () => _launchURL(subtitle),
                          child: const Text('Read more'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink,
                            fixedSize: const Size(100, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                          ),                         
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Text(
                      title,
                      style: const TextStyle( fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 2,
                    )
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2, left: 12),
                      child: Text(
                        description,
                        style: const TextStyle( fontSize: 14, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void _launchURL(String url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}
