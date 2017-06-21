package com.pgs.controller;

import com.pgs.common.CookieUtil;
import com.pgs.common.GlobalConstant;
import com.pgs.common.Md5;
import com.pgs.common.StringUtils;
import com.pgs.model.AcUser;
import com.pgs.service.AcUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/6/21.
 */
@RestController
public class LoginController {
    public static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private AcUserService acUserService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Map<String, Object> login(AcUser user, Model model, HttpServletResponse response, HttpServletRequest request) throws IOException {
        String msg = "";
        Map<String, Object> map = new HashMap<>();
        int flag = GlobalConstant.LOGIN_ERROR;
        if (null == user || StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())) {
            msg = GlobalConstant.NO_PASSWORDANDUSER;
        } else {
            AcUser acUser = acUserService.selectUserByName(user.getUsername());
            if (null != acUser) {
                if (Md5.md5Digest(user.getPassword()).equals(acUser.getPassword())) {
                    CookieUtil.setLoginUser(response, acUser);
                    flag = GlobalConstant.LOGIN_SUCCESS;
                } else {
                    msg = GlobalConstant.ERROR_PASSWORD;
                }
            } else {
                msg = GlobalConstant.NO_USER;
            }
        }
        map.put("flag", flag);
        map.put("msg", msg);
        return map;
    }
}
