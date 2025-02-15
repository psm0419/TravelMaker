package com.app.dto.festival;

import lombok.Data;

@Data
public class FestivalImage {
    int imageId;
    int festivalId;
    String filePath;
    String fileName;
    String mimeType;
}
