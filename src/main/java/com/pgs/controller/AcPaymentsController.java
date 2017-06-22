package com.pgs.controller;

import com.pgs.common.CookieUtil;
import com.pgs.common.GlobalConstant;
import com.pgs.common.StringUtils;
import com.pgs.controller.Base.BaseController;
import com.pgs.model.AcPayments;
import com.pgs.model.AcUser;
import com.pgs.service.AcPaymentsService;
import com.pgs.vo.AcPaymentsVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by x on 2017/6/21.
 * 流水信息
 */
@RestController
public class AcPaymentsController extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(AcPaymentsController.class);
    @Autowired
    private AcPaymentsService acPaymentsService;

    @RequestMapping(value = "/saveOrupdate", method = RequestMethod.POST)
    public Map<String, Object> saveOrupdate(AcPayments acPayments, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        int flag = GlobalConstant.LOGIN_SUCCESS;
        AcUser acUser = CookieUtil.getLoginUser(request);
        String msg = "";
        if (null == acUser) {
            flag = GlobalConstant.LOGIN_ERROR;
        } else {
            if (null != acPayments) {
                int count;
                Date now = new Date();
                acPayments.setUpdatetime(now);
                if (StringUtils.isEmpty(acPayments.getId())) {//save
                    acPayments.setUserid(acUser.getId());
                    acPayments.setCreatetime(now);
                    if (StringUtils.isEmpty(acPayments.getEditTime())) {
                        acPayments.setEditTime(now);
                    }
                    count = acPaymentsService.insertSelective(acPayments);
                } else {//update
                    count = acPaymentsService.updateByPrimaryKeySelective(acPayments);
                }
                if (count > 0) {
                    msg = GlobalConstant.MSG_SAVE_SUCCESS;
                } else {
                    msg = GlobalConstant.MSG_SAVE_FAIL;
                }
            } else {
                msg = GlobalConstant.MSG_NO_MESSAGE;
            }
        }
        map.put("flag", flag);
        map.put("msg", msg);
        return map;
    }

    @RequestMapping(value = "selectByCondition", method = RequestMethod.POST)
    public Map<String, Object> selectByCondition(AcPaymentsVo acPaymentsVo, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        String msg = "";
        AcUser acUser = CookieUtil.getLoginUser(request);
        int flag = GlobalConstant.LOGIN_SUCCESS;
        if (null == acUser) {
            flag = GlobalConstant.LOGIN_ERROR;
        } else {
            if (acPaymentsVo == null) {
                flag = GlobalConstant.NO_MESSAGE;
                msg = GlobalConstant.MSG_NO_MESSAGE;
            } else {
                acPaymentsVo.setUserid(acUser.getId());
                List<AcPaymentsVo> list = acPaymentsService.selectByCondition(acPaymentsVo);
                map.put("list", list);
            }
        }
        map.put("flag", flag);
        map.put("msg", msg);
        return map;
    }
}