package controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.TOrders;
import pojo.TOrdersDetail;
import service.OrderService;
import service.impl.OrderServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    OrderServiceImpl service;

    @RequestMapping("/Do_Select")
    @ResponseBody
    public PageInfo<TOrders> Do_Select(Integer pageIndex){
        System.out.println("进入了分页查询");
        PageHelper.startPage(pageIndex,5);
        List<TOrders> apples=service.getAll();
        System.out.println(apples);
        PageInfo<TOrders> pageInfo = new PageInfo<>(apples,5);
        return pageInfo;
    }


    @RequestMapping("/Select_ByID")
    @ResponseBody
    public PageInfo<TOrdersDetail> Select_ByID(Integer pageIndex, Integer user, HttpServletRequest request){
        System.out.println("进入了分页查询");
        PageHelper.startPage(pageIndex,5);
        System.out.println("没问题"+user);
        List<TOrdersDetail> apples=service.Select_ByID(user);
        request.getSession().setAttribute("list",apples);
        PageInfo<TOrdersDetail> pageInfo = new PageInfo<>(apples,5);
        return pageInfo;
    }


    @RequestMapping("/Select")
    public  String select(Integer id, HttpServletRequest request){
        System.out.println("编号是"+id);
        request.getSession().setAttribute("user_id",id);
        List<TOrdersDetail> aaa= service.Select_ByID_User(id);
        request.getSession().setAttribute("aaa",aaa);
        return "Update.jsp";
    }



    @RequestMapping("/search_name")
    @ResponseBody
    public PageInfo<TOrders> search_name(Integer pageIndex,Integer select,Integer statu,String date){
        System.out.println("进入了条件查询");
        System.out.println("进入了条件查询"+select);
        System.out.println("进入了条件查询"+statu);
        System.out.println("进入了条件查询"+date);
        PageHelper.startPage(pageIndex,5);
        List<TOrders> apples=service.search_name(select,statu,date);
        PageInfo<TOrders> pageInfo = new PageInfo<>(apples,5);
        return pageInfo;
    }

}
