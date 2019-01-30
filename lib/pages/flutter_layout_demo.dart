import 'package:flutter/material.dart';

class LayoutDemo extends StatefulWidget {
  _LayoutDemoState createState() => _LayoutDemoState();
}

class _LayoutDemoState extends State<LayoutDemo> {
  bool like = true;
  int likeCount = 41;

  void _onLink() {
    setState(() {
      likeCount = this.like ? likeCount - 1 : likeCount + 1;
      like = !like;
    });
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, color: color, size: 20.0,),
        Container(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(title: Text('布局Demo'),),
      body: Container(
        color: Colors.white54,
        child: ListView(
          children: <Widget>[
            /* 1 */
            Image.asset(
              'lib/assets/header-bg.jpg',
              fit: BoxFit.cover,
            ),
            /* 2 */
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Oeschinen Lake Campground', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.grey[500],)),
                      ],
                    ),
                  ),
                  // Icon(Icons.star, color: Colors.red[500],),
                  // IconButton(
                  //   padding: const EdgeInsets.all(0.0),
                  //   icon: this.like ? Icon(Icons.star) : Icon(Icons.star_border), 
                  //   color: Colors.red[500],
                  //   onPressed: _onLink,
                  // ),
                  GestureDetector(
                    child: this.like ? Icon(Icons.star, color: Colors.red[500],) : Icon(Icons.star_border, color: Colors.red[500],),
                    onTap: _onLink,
                  ),
                  Text('$likeCount')
                ],
              ),
            ),
            /* 3 */
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildButtonColumn(color, Icons.call, 'CALL'),
                  _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
                  _buildButtonColumn(color, Icons.share, 'SHARE'),
                ],
              ),
            ),
            /* 4 */
            Container(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                  'Alps. Situated 1,578 meters above sea level, it is one of the '
                  'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                  'half-hour walk through pastures and pine forest, leads you to the '
                  'lake, which warms to 20 degrees Celsius in the summer. Activities '
                  'enjoyed here include rowing, and riding the summer toboggan run.',
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
