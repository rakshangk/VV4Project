import 'package:flutter/material.dart';
import 'package:vv4/Models/SpottedList.dart';

class HungerItemList extends StatefulWidget
{
	final SpottedList m_oSpottedList;

	HungerItemList (SpottedList oSpottedList)
			: m_oSpottedList = oSpottedList,
				super(key: new ObjectKey(oSpottedList));

	@override
	HungerItemListState createState ()
	{
		return new HungerItemListState(m_oSpottedList);
	}
}

class HungerItemListState extends State<HungerItemList>
{
	final SpottedList oSpottedList;

	HungerItemListState (this.oSpottedList);

	@override
	Widget build (BuildContext context)
	{

		final makeListTile = ListTile (
				contentPadding: EdgeInsets.symmetric (horizontal: 10.0, vertical: 20.0),
				leading: Container (
					padding: EdgeInsets.only (right: 10.0),
					decoration: new BoxDecoration(
							border: new Border(
									right: new BorderSide(width: 2.0, color: Colors.white24))),
					child: new Image.network(
						oSpottedList.oImageFile.m_strFilePath,
						width: 60.0,
					),
				),
				title: Text (
					'#' + oSpottedList.m_strHungersCount.toString ()+' Person(s)',
					style: TextStyle (color: Colors.white, fontWeight: FontWeight.bold),
				),
				subtitle: Column (
					children: <Widget>[
						Row (
							children: <Widget>[
								Text (
									oSpottedList.m_strGeoLocation,
									style: TextStyle (
											color: Colors.white, fontWeight: FontWeight.bold),
								),
							],
						),
						Row (
							children: <Widget>[
								Text ('Address : ' + 'ABC',
										style: TextStyle (
												color: Colors.white, fontWeight: FontWeight.bold))
							],
						),
					],
				),
				trailing:
				Icon (Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));

		final makeCard = Card (
			elevation: 8.0,
			margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
			child: Container (
				decoration: BoxDecoration (color: Color.fromRGBO (64, 75, 96, .9)),
				child: makeListTile,
			),
		);

		return Container (
			decoration: BoxDecoration (color: Color.fromRGBO (64, 75, 96, .9)),
			child: makeCard,
		);
	}
}
