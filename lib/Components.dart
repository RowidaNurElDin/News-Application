import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/Cubit/cubit.dart';
import 'package:news_application/Screens/webView.dart';

Widget NewsTile(String imageurl, String tileText, String date,String url , context) => InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => webViewScreen(url)));
  },
  child:   Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageurl == "" ? AssetImage("images/loading.png") : NetworkImage(imageurl) as ImageProvider ,
                ),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        tileText,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
);

Widget NewsList(dataList, {isSearch = false}) => ConditionalBuilder(
    condition: dataList.length > 0,
    builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => NewsTile(
          dataList[index]['urlToImage'] == null ? "" :dataList[index]['urlToImage'] ,
          dataList[index]['title'],
          dataList[index]['publishedAt'],
          dataList[index]['url'],
          context,
        ),
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(8),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        itemCount: dataList.length),
    fallback: (context) => isSearch? Container() : Center(child: CircularProgressIndicator()));

Widget SideDrawer(context) =>Drawer(
  child: ListView(
    children: [
      DrawerHeader(
          child: Text("A5barak")
      ),
      IconButton(
          onPressed: (){
            AppCubit.get(context).changeTheme();
          },
          icon:Icon( Icons.brightness_2_rounded , color: Colors.black,))
    ],
  ),

);
