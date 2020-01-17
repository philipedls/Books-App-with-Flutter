import 'package:flutter/material.dart';

import '../book.dart';

class BookWidget extends StatelessWidget {
  final Book book;
  VolumeInfo get bookInfo => book.volumeInfo;

  final _imageUrl =
      "https://images.unsplash.com/photo-1535498730771-e735b998cd64?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80";

  const BookWidget({Key key, @required this.book})
      : assert(book != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 250.0,
      margin: EdgeInsets.only(left: 24.0, right: 24.0),
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  bookInfo.imageLinks.smallThumbnail,
                  width: 180.0,
                  fit: BoxFit.fitWidth,
                ),
              )),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 40.0),
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 20.0)
                  ],
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        bookInfo.title,
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      height: 20.0,
                      color: Colors.transparent,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        bookInfo.authors[0],
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    Divider(
                      height: 20.0,
                      color: Colors.transparent,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Future<NetworkImage> _buildImageWiget() {
  //   return NetworkImage(_imageUrl).;
  // }
}
