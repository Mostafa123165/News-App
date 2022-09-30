import 'package:flutter/material.dart';
import 'package:newsapp/modules/wepview/wep-view-screen.dart';

Widget itemBuilder(context , dynamic item ) =>  InkWell(
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 100,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 120,
            child: Image(
              image: NetworkImage(
                '${item['urlToImage']}',
              ),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item['title']}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.4,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${item['publishedAt']}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  ),
  onTap: () {
    navigator(context, WebViewScreen(item['url']),);
  },
);

void navigator (BuildContext context,widget) =>Navigator.push(
    context,
    MaterialPageRoute(
      builder:(context)=>widget,
    )
);
