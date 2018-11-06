import 'package:flutter/material.dart';
import 'package:vv4/Models/SpottedList.dart';


class HungerItemList extends StatefulWidget {
  final SpottedList m_oSpottedList;

  HungerItemList(SpottedList oSpottedList)
      : m_oSpottedList = oSpottedList,
        super(key: new ObjectKey(oSpottedList));

  @override
  HungerItemListState createState() {
    return new HungerItemListState(m_oSpottedList);
  }
}

class HungerItemListState extends State<HungerItemList> {
  final SpottedList oSpottedList;

  HungerItemListState(this.oSpottedList);

  @override
  Widget build(BuildContext context) {
    final makeListTile = ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: new Image(
            image: new AssetImage(oSpottedList.m_strImage),
            width: 50.0,
          ),
        ),
        title: Text(
          'No of Hungers : '+oSpottedList.m_strHungersCount,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),


        subtitle: Column(
	        children: <Widget>[
		        Row(
			        children: <Widget>[
				        Text(
					        'Distance : '+oSpottedList.m_strDistance,
					        style:
					        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
				        ),

			        ],
		        ),
		        Row(
				        children: <Widget>[
					        Text('Address : ' + oSpottedList.m_strAddress,
							        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
				        ],
		        ),
	        ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));

    final makeCard = Card(
	    elevation: 8.0,
	    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
	    child: Container(
		    decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
		    child: makeListTile,
	    ),
    );

    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
      child: makeCard,
    );
    /* return new Container(
      padding: EdgeInsets.all(5.0),
      child: Material(
        borderRadius: BorderRadius.circular(0.0),
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 50.0,
          height: 200.0,
          child:new Image(image: new AssetImage(oHunger.m_strImage)),
        ),
      ),
    );

   return new Container(
      padding: EdgeInsets.all(5.0),
      child: Material(
        borderRadius: BorderRadius.circular(2.0),
        elevation: 5.0,
        child: MaterialButton(
          child:  new ListTile(
            onTap: null,
            leading: new Row(
              children: <Widget>[
                new Image.network(
                  'http://techmust.com/wp-content/uploads/2018/04/cropped-TechMust_Board-250-1.jpg',width: 100.0,),
                new Expanded(child: new Text(oHunger.m_strHungersCount)),
                new Expanded(child: new Text(oHunger.m_strDistance)),
              ],
            ),
            title: new Row(
              children: <Widget>[

                new Expanded(child: new Text(oHunger.m_strAddress)),
              ],
            ),
          ),
        ),
      ),
    );*/
  }
}
