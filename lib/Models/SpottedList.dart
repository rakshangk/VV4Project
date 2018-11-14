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
	String m_strFilePath;

	ImageFile ({
		this.m_strFilePath,
	});

	factory ImageFile.fromJson(Map<String, dynamic> json) {
		return ImageFile (
			m_strFilePath: json['m_strFilePath'],
		);
	}
}

class SpottedList
{
	final String m_strGeoLocation;
	final int m_strHungersCount;
	final ImageFile oImageFile;

	SpottedList ({this.m_strHungersCount, this.m_strGeoLocation, this.oImageFile});

	factory SpottedList.fromJson(Map<String, dynamic> json) {
		return SpottedList (
			m_strHungersCount: json["m_nHungersCount"],
			m_strGeoLocation: json['m_strGeoLocation'] as String,
			oImageFile: ImageFile.fromJson (json['m_oFileDetails']),
		);
	}
}
