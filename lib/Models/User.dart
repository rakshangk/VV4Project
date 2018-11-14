class User
{
	String m_strUsername;
	String m_strPassword;

	User ({this.m_strUsername, this.m_strPassword});

	factory User.fromJson(Map<String, dynamic> json) {
		return User (
			m_strUsername: json['username'],
			m_strPassword: json['password'],
		);
	}

	String get username
	=> m_strUsername;

	String get password
	=> m_strPassword;
}
