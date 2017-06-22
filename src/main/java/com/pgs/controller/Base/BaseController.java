package com.pgs.controller.Base;

import com.sun.beans.editors.DoubleEditor;
import com.sun.beans.editors.FloatEditor;
import com.sun.beans.editors.LongEditor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017/6/22.
 */
public abstract class BaseController {
    /**
     * 此方法用于日期的转换，如果未加，当页面格式转化错误，将400，实际是因为此方法
     *
     * @param binder
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
//        binder.registerCustomEditor(long.class, new LongEditor());
//        binder.registerCustomEditor(double.class, new DoubleEditor());
//        binder.registerCustomEditor(float.class, new FloatEditor());
    }
}

