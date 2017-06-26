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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
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
    public Map<String, Object> login(AcUser user, HttpServletResponse response) throws IOException {
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

    /**
     * 注册
     */
    @RequestMapping(value = "register", method = RequestMethod.POST)
    public Map<String, Object> register(AcUser user) {
        String msg = "";
        int flag;
        Map<String, Object> map = new HashMap<>();
        if (null == user || StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())) {
            msg = GlobalConstant.MSG_NO_MESSAGE;
            flag = GlobalConstant.NO_MESSAGE;
        } else {
            Date now = new Date();
            user.setCreatetime(now);
            user.setLastlogintime(now);
            user.setUpdatetime(now);
            user.setPassword(Md5.md5Digest(user.getPassword()));
            int count = acUserService.insertSelective(user);
            if (count > 0) {
                msg = GlobalConstant.MSG_REGISTER_SUCCESS;
                flag = GlobalConstant.REGISTER_SUCCESS;
            } else {
                msg = GlobalConstant.MSG_REGISTER_FAIL;
                flag = GlobalConstant.REGISTER_FAIL;
            }
        }
        map.put("msg", msg);
        map.put("flag", flag);
        return map;
    }
}
