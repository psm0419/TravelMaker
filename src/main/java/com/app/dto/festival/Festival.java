package com.app.dto.festival;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Festival {
	
	int festivalId;
	String festivalName;
	String location;
	String postNumber;
	String status;
	String startDate;
	String endDate;
	String entranceFee;
	String tel;
	String festivalHost;

}
