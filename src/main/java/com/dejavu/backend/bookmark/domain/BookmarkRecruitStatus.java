package com.dejavu.backend.bookmark.domain;

public enum BookmarkRecruitStatus {

	OPEN("\uBAA8\uC9D1 \uC911"),
	CLOSING_SOON("\uB9C8\uAC10 \uC784\uBC15"),
	CLOSED("\uB9C8\uAC10");

	private final String text;

	BookmarkRecruitStatus(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}
}
