package com.app.controller.attraction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.attraction.AttractionInfo;
import com.app.service.attraction.AttractionService;

@Controller
@RequestMapping("/attractions")
public class AttractionController {

    @Autowired
    AttractionService attractionService;
    
    @GetMapping("/list")
    @ResponseBody
    public List<AttractionInfo> getAttractions() {
        return attractionService.findAttractions();
    }
    @GetMapping("/map")
    public String showAttractionMap() {
    	System.out.println(" /attractions/map 요청 들어옴");
        return "attraction/AttractionMap";
    }
    
}
