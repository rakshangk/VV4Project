class SpottedList {
  final String m_HungersCount, m_strImage, m_strDistance, m_strAddress;

  SpottedList({
    this.m_HungersCount,
    this.m_strImage,
    this.m_strDistance,
    this.m_strAddress,
  });

  factory SpottedList.fromJson(Map<String, dynamic> json) {
    return new SpottedList(
      m_HungersCount: json['m_strHungersCount'].toString(),
      m_strImage: json['m_strImage'].toString(),
      m_strDistance: json['m_strDistance'].toString(),
      m_strAddress: json['m_strAddress'].toString(),
    );
  }
}
