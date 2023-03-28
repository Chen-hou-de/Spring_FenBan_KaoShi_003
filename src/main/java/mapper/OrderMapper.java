package mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import pojo.TOrders;
import pojo.TOrdersDetail;

import java.util.List;

@Mapper
public interface OrderMapper {

    List<TOrdersDetail> Select_ByID(@Param("id") Integer id);

    @Select("select * from  `t_orders_detail` s join  t_provider c  on c.id = s.provider_id  where  s.order_id in(select order_id from t_orders where org_id=#{id} )")
    List<TOrdersDetail> Select_ByID_User(@Param("id") Integer id);

    List<TOrders> getAll();


    List<TOrders> search_name(@Param("select") Integer select,@Param("statu") Integer statu,@Param("date") String date);



}
