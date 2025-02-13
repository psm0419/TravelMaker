package com.app.dto.festival;

import java.util.List;

import lombok.Data;

@Data
public class Festival {

	int festivalId;
	String festivalName;
	String  location;	
	String  startDate;
	String  endDate;
	String  entranceFee;
	String  tel;
	String  festivalHost;
	List<FestivalImage> images;
	String homepageUrl;
	String content;
}
