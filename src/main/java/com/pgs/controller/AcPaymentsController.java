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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by x on 2017/6/21.
 * 流水信息
 */
@RestController
@RequestMapping("/payment")
public class AcPaymentsController{
    private static Logger logger = LoggerFactory.getLogger(AcPaymentsController.class);
    @Autowired
    private AcPaymentsService acPaymentsService;

    @RequestMapping(value = "/saveOrupdate", method = RequestMethod.POST)
    public Map<String, Object> saveOrupdate(AcPayments acPayments, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        int flag = GlobalConstant.LOGIN_SUCCESS;
        int editCode = GlobalConstant.NORMAL;
        AcUser acUser = CookieUtil.getLoginUser(request);
        String msg = "";
        if (null == acUser) {
            flag = GlobalConstant.LOGIN_ERROR;
        } else {
            if (null != acPayments) {
                int count;
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String now = sdf.format(new Date());
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
                    editCode = GlobalConstant.SAVE_SUCCESS;
                } else {
                    msg = GlobalConstant.MSG_SAVE_FAIL;
                    editCode = GlobalConstant.SAVE_FAIL;
                }
            } else {
                msg = GlobalConstant.MSG_NO_MESSAGE;
                editCode = GlobalConstant.NO_MESSAGE;
            }
        }
        map.put("flag", flag);
        map.put("editCode", editCode);
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

    @RequestMapping(value = "del", method = RequestMethod.POST)
    public Map<String, Object> del(Integer id) {
        Map<String, Object> map = new HashMap<>();
        int flag;
        String msg = "";
        if (StringUtils.isEmpty(id)) {
            flag = GlobalConstant.NO_MESSAGE;
            msg = GlobalConstant.MSG_NO_MESSAGE;
        } else {
            int count = acPaymentsService.deleteByPrimaryKey(id);
            if (count > 0) {
                flag = GlobalConstant.DEL_SUCCESS;
                msg = GlobalConstant.MSG_DEL_SUCCESS;
            } else {
                flag = GlobalConstant.DEL_FAIL;
                msg = GlobalConstant.MSG_DEL_FAIL;
            }
        }
        map.put("flag", flag);
        map.put("msg", msg);
        return map;
    }

    @RequestMapping(value = "selectOne", method = RequestMethod.GET)
    public Map<String, Object> selectOne(Integer id) {
        Map<String, Object> map = new HashMap<>();
        int flag = GlobalConstant.NORMAL;
        String msg = "";
        if (StringUtils.isEmpty(id)) {
            flag = GlobalConstant.NO_MESSAGE;
            msg = GlobalConstant.MSG_NO_MESSAGE;
        } else {
            AcPayments acPayments = acPaymentsService.selectByPrimaryKey(id);
            map.put("payment", acPayments);
        }
        map.put("flag", flag);
        map.put("msg", msg);
        return map;
    }
}