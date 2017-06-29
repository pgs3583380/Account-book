package com.pgs.controller;

import com.pgs.common.GlobalConstant;
import com.pgs.common.StringUtils;
import com.pgs.model.AcCategory;
import com.pgs.service.AcCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/6/21.
 * 资金类别
 */
@RestController
public class AcCategoryController {
    @Autowired
    private AcCategoryService acCategoryService;

    /**
     * 获取二级目录
     *
     * @return
     */
        @RequestMapping(value = "getlevel", method = RequestMethod.GET)
    public Map<String, Object> selectByLevel1(int level) {
        Map<String, Object> map = new HashMap<>();
        List<AcCategory> list = acCategoryService.selectByLevel(level);
        map.put("list", list);
        return map;
    }

    /**
     * 获取下一级目录
     *
     * @param parentId 父级目录id
     * @return
     */
    @RequestMapping(value = "getchild", method = RequestMethod.GET)
    public Map<String, Object> selectChild(int parentId) {
        List<AcCategory> list = new ArrayList();
        Map<String, Object> map = new HashMap<>();
        String msg = "";
        int flag = GlobalConstant.NORMAL;
        if ("".equals(parentId) || parentId == 0) {
            msg = GlobalConstant.MSG_NO_MESSAGE;
            flag = GlobalConstant.NO_MESSAGE;
        } else {
            list = acCategoryService.selectChild(parentId);
        }
        map.put("flag", flag);
        map.put("msg", msg);
        map.put("list", list);
        return map;
    }
}