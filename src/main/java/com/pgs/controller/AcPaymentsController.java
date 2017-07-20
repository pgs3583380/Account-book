package com.pgs.controller;

import com.pgs.common.CookieUtil;
import com.pgs.common.GlobalConstant;
import com.pgs.common.StringUtils;
import com.pgs.model.AcPayments;
import com.pgs.model.AcUser;
import com.pgs.service.AcPaymentsService;
import com.pgs.vo.AcPaymentsVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by x on 2017/6/21.
 * 流水信息
 */
@Controller
@RequestMapping("/payment")
public class AcPaymentsController {
    private static Logger logger = LoggerFactory.getLogger(AcPaymentsController.class);
    @Autowired
    private AcPaymentsService acPaymentsService;

    @RequestMapping(value = "/index")
    public String getIndex(HttpServletRequest request, Model model) {
        Map<String, Object> map = new HashMap<>();
        AcUser acUser = CookieUtil.getLoginUser(request);
        if (null == acUser) {
            return "redirect:/";
        }

        getMoney(map, acUser);
        getUseDays(map, acUser);
        model.addAttribute("num", map);
        return "/payment/index";
    }

    /**
     * 获取用户总资产，总支出，总收入
     */
    private void getMoney(Map<String, Object> map, AcUser acUser) {
        AcPaymentsVo vo = new AcPaymentsVo();
        vo.setUserid(acUser.getId());
        List<AcPaymentsVo> list = acPaymentsService.selectPayAndIncome(vo);
        BigDecimal pay = new BigDecimal(0);
        BigDecimal income = new BigDecimal(0);
        for (AcPaymentsVo aVo : list) {
            if (aVo.getMoneyType() == 1) {
                pay = aVo.getMoney();
            }
            if (aVo.getMoneyType() == 2) {
                income = aVo.getMoney();
            }
        }
        BigDecimal all = income.subtract(pay);
        map.put("pay", pay);
        map.put("all", all);
        map.put("income", income);
    }

    /**
     * 获取用户使用账本的天数
     */
    private void getUseDays(Map<String, Object> map, AcUser acUser) {
        int days = acPaymentsService.selectAllDays(acUser.getId());
        map.put("days", days);
        map.put("name", acUser.getUsername());
    }

    @RequestMapping(value = "/charge", method = RequestMethod.GET)
    public String toCharge() {
        return "/payment/charge";
    }

    @RequestMapping(value = "/capitalflow", method = RequestMethod.GET)
    public String toCapitalFlow() {
        return "/payment/capitalflow";
    }

    @RequestMapping(value = "/saveOrupdate", method = RequestMethod.POST)
    @ResponseBody
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

    @RequestMapping(value = "selectByCondition", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> selectByCondition(AcPaymentsVo acPaymentsVo, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        AcUser acUser = CookieUtil.getLoginUser(request);
        List<AcPaymentsVo> list = new ArrayList<>();
        if (null != acUser) {
            if (acPaymentsVo == null) {
                acPaymentsVo = new AcPaymentsVo();
            }
            acPaymentsVo.setUserid(acUser.getId());
            list = acPaymentsService.selectByCondition(acPaymentsVo);
        }
        map.put("aaData", list);
        return map;
    }

    @RequestMapping(value = "del", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> del(Integer id) {
        Map<String, Object> map = new HashMap<>();
        int flag;
        String msg;
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
    @ResponseBody
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

    /**
     * 统计二级分类情况
     */
    @RequestMapping(value = "getStats", method = RequestMethod.POST)
    public Map<String, Object> getStats(AcPaymentsVo vo, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        AcUser acUser = CookieUtil.getLoginUser(request);
        int flag = GlobalConstant.LOGIN_SUCCESS;
        List<AcPaymentsVo> list = new ArrayList<>();
        String msg = "";
        if (null == acUser) {
            flag = GlobalConstant.LOGIN_ERROR;
        } else {
            if (vo != null) {
                vo.setUserid(acUser.getId());
                list = acPaymentsService.selectForStats(vo);
            } else {
                flag = GlobalConstant.NO_MESSAGE;
                msg = GlobalConstant.MSG_NO_MESSAGE;
            }
        }
        map.put("flag", flag);
        map.put("msg", msg);
        map.put("list", list);
        return map;
    }

    @RequestMapping(value = "/getInfo/{moneyType}", method = RequestMethod.GET)
    @ResponseBody
    public void getYearInfo(@PathVariable int moneyType, HttpServletRequest request, HttpServletResponse response) throws IOException {
        AcUser acUser = CookieUtil.getLoginUser(request);
        AcPaymentsVo vo = new AcPaymentsVo();
        vo.setMoneyType(moneyType);
        vo.setUserid(acUser.getId());
        vo.setYear(StringUtils.getYear());
        List<AcPaymentsVo> list = acPaymentsService.selectPayAndIncomeYear(vo);
        List<String> moneys = new ArrayList<>();
        for (int i = 1; i < 13; i++) {
            String money = "0";
            for (AcPaymentsVo v : list) {
                if (v.getMonths() == i) {
                    money = v.getMoneys();
                    break;
                }
            }
            moneys.add(money);
        }

        StringUtils.JsonWrite(response, moneys);
    }
}