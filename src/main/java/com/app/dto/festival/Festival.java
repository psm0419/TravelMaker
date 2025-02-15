package com.app.dto.festival;

<<<<<<< HEAD
import java.time.LocalDate;
=======
import java.util.List;
>>>>>>> 6695434250f6b8328319109c277eb09bf2af732b

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
	int likeCount;
}
