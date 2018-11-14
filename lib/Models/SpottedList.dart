class Lists
{
	final List<SpottedList> kLists;

	Lists ({
		this.kLists,
	});

	factory Lists.fromJson(List<dynamic> parsedJson) {
		List<SpottedList> kLists = new List<SpottedList>();
		kLists = parsedJson.map ((i)
		=> SpottedList.fromJson (i)).toList ();
		return new Lists(
			kLists: kLists,
		);
	}
}

class ImageFile
{
	String m_strFileId;

	ImageFile ({
		this.m_strFileId,
	});

	factory ImageFile.fromJson(Map<String, dynamic> json) {
		return ImageFile (
			m_strFileId: json['m_strFileId'],
		);
	}
}

class SpottedList
{
	final double m_nLatitude;
	final double m_nLongitude;
	final int m_strHungersCount;
	final ImageFile oImageFile;

	SpottedList ({this.m_strHungersCount, this.m_nLatitude,this.m_nLongitude, this.oImageFile});

	factory SpottedList.fromJson(Map<String, dynamic> json) {
		return SpottedList (
			m_strHungersCount: json["m_nHungersCount"],
			m_nLatitude: json['m_nLatitude'] as double,
			m_nLongitude: json['m_nLongitude'] as double,
			oImageFile: ImageFile.fromJson (json['m_oFileDetails']),
		);
	}
}
