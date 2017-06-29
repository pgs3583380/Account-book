package com.pgs.controller;

import com.pgs.common.CookieUtil;
import com.pgs.common.GlobalConstant;
import com.pgs.common.Md5;
import com.pgs.common.StringUtils;
import com.pgs.model.AcUser;
import com.pgs.service.AcPaymentsService;
import com.pgs.service.AcUserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/6/21.
 */
@Controller
public class LoginController {
    public static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private AcUserService acUserService;
    @Autowired
    private AcPaymentsService acPaymentsService;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showLogin() {
        return "/user/login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String showRegister() {
        return "/user/register";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(AcUser user, HttpServletResponse response, HttpSession session) throws IOException {
        if (null == user || StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())) {
            session.setAttribute("msg", "用户名或密码不能为空");
            return "redirect:/";
        }
        AcUser acUser = acUserService.selectUserByName(user.getUsername());
        if (null != acUser) {
            if (Md5.md5Digest(user.getPassword()).equals(acUser.getPassword())) {
                CookieUtil.setLoginUser(response, acUser);
                return "redirect:/payment/index";
            }
        }
        session.setAttribute("msg", "用户名密码错误");
        session.setMaxInactiveInterval(2);
        return "redirect:/";
    }

    /**
     * 注册
     */
    @RequestMapping(value = "/toregister", method = RequestMethod.POST)
    public String register(AcUser user, HttpSession session) {
        String msg = "";
        if (null == user || StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())) {
            msg = GlobalConstant.MSG_NO_MESSAGE;
        } else {
            if (!checkValidName(user.getUsername())) {
                msg = GlobalConstant.MSG_NO_VALIAD_NAME;
            } else {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String now = sdf.format(new Date());
                user.setCreatetime(now);
                user.setLastlogintime(now);
                user.setUpdatetime(now);
                user.setPassword(Md5.md5Digest(user.getPassword()));
                int count = acUserService.insertSelective(user);
                if (count > 0) {
                    msg = GlobalConstant.MSG_REGISTER_SUCCESS;
                } else {
                    msg = GlobalConstant.MSG_REGISTER_FAIL;
                }
            }
        }
        session.setAttribute("msg", msg);
        session.setMaxInactiveInterval(2);
        return "redirect:/register";
    }

    /**
     * 判断用户名是否重复
     */
    public boolean checkValidName(String userName) {
        AcUser user = acUserService.selectUserByName(userName);
        if (null == user) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletResponse response) {
        CookieUtil.removeCookie(response, CookieUtil.USER_INFO, "/");
        return "redirect:/";
    }
}
