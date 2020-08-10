package com.kindergarten.service;

import com.kindergarten.bean.FaceUserList;

public interface FaceService {

    String faceSearch(String base64);

    String faceAdd(String base64, FaceUserList faceUserList);
}
