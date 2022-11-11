import 'package:flutter/material.dart';
import 'package:restflutter/models/Post.dart';
import 'package:restflutter/services/service.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];
  var isloaded = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    Service().fetchPost().then((value) => {
          setState(() {
            posts = value;
            isloaded = true;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Visibility(
        visible: isloaded,
        // ignore: sort_child_properties_last
        child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(16),
                child : Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration:  BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 16,),
                    Expanded(child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(posts[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(
                            posts[index].body,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          
                        ],
                        
                      ))
                ],)
                  
              );
            }),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  operator ==(Object other) {
    // TODO: implement ==
    throw UnimplementedError();
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}
