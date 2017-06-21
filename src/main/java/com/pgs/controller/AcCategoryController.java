package com.pgs.controller;

import com.pgs.service.AcCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * Created by Administrator on 2017/6/21.
 */
@RestController
public class AcCategoryController {
    @Autowired
    private AcCategoryService acCategoryService;

    @RequestMapping(value = "getlevel1", method = RequestMethod.GET)
    public Map<String, Object> selectByLevel1() {
        return null;
    }
}
