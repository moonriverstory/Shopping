package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import shiro.CustomRealm;


@Controller
public class ClearShiroCache
{
    @Autowired
    private CustomRealm customRealm;

    @RequestMapping("/clearShiroCache")
    public String clearShiroCache()
    {

        //清除缓存,将来开发要在service调用
        customRealm.clearCached();
        return "success";
    }
}
