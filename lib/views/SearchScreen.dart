import 'package:flutter/material.dart';
import 'package:newsapp/controller/news.dart';
import 'package:newsapp/controller/widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var newslist = [];
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final vm = Search();
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                "BBC",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "News",
                style: TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              onSubmitted: (value)async {
                if (value.isNotEmpty) {
                  newslist =await vm.search(value);
                  setState(()  {
                    
                    print('news list called');
                  });
                }
              },
              decoration: InputDecoration(
                  labelText: "Search",
                  icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search)),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  )),
            ),
            Expanded(
              child: newslist.isEmpty
                  ? Text("No results found")
                  : SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: newslist.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                imgUrl: newslist[index].imageURL ?? "",
                                title: newslist[index].title ?? "",
                                desc: newslist[index].description ?? "",
                             //   content: newslist[index].content ?? "",
                                posturl: newslist[index].url ?? "",
                              );
                            }),
                      ),
                    ),
            )
          ],
        ));
  }
}
