package com.app.dto.festival;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Festival {
	    private int festivalId;
	    private String festivalName;
	    private String location;
	    private String startDate;
	    private String endDate;
	    private String entranceFee;
	    private String tel;
	    private String festivalHost;
	    private String homepageUrl;
}
