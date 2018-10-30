class FormValadation {
	String passwordNotMatched(var textbox, String value) {
		String strMsg;
		if ((value != textbox.text)) strMsg = "Password did not match";
		return strMsg;
	}

	String emailNotMatched(String value) {
		String strMsg;
		String strPattern =
				r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
		RegExp regExp = new RegExp(strPattern);
		bool bisValid = regExp.hasMatch(value);
		if (!bisValid) strMsg = "Email ID is not valid!";
		return strMsg;
	}


}
