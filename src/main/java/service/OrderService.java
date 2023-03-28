package service;

import org.apache.ibatis.annotations.Param;
import pojo.TOrders;
import pojo.TOrdersDetail;

import java.util.List;

public interface OrderService {


    List<TOrders> getAll();

    List<TOrders> search_name(Integer select,Integer statu,String date);

    List<TOrdersDetail> Select_ByID(@Param("id") Integer id);

    List<TOrdersDetail> Select_ByID_User(@Param("id") Integer id);

}
