import 'package:flutter/material.dart';

class ShowCase extends StatelessWidget {
  final Offset infoContainer;
  final String description;
  final Function onTap;
  ShowCase({this.infoContainer, this.description, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: infoContainer.dy + 20,
            left: infoContainer.dx - 10.0,
            child: Icon(
              Icons.arrow_drop_up,
              size: 70.0,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: infoContainer.dy + 60.0,
            child: Container(
                width: MediaQuery.of(context).size.width - 50,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    GestureDetector(
                        child: Text(
                          "CLOSE",
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                        onTap: onTap)
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
