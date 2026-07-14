package com.dejavu.backend.calendar.domain;

public enum CalendarRecruitStatus {

	OPEN("\uBAA8\uC9D1 \uC911", CalendarColorType.GREEN),
	CLOSING_SOON("\uB9C8\uAC10 \uC784\uBC15", CalendarColorType.ORANGE),
	CLOSED("\uB9C8\uAC10", CalendarColorType.GRAY);

	private final String text;
	private final CalendarColorType colorType;

	CalendarRecruitStatus(String text, CalendarColorType colorType) {
		this.text = text;
		this.colorType = colorType;
	}

	public String getText() {
		return text;
	}

	public CalendarColorType getColorType() {
		return colorType;
	}
}
