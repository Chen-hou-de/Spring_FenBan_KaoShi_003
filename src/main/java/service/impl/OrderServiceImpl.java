package service.impl;

import mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.TOrders;
import pojo.TOrdersDetail;
import service.OrderService;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

@Autowired
    OrderMapper mapper;

    @Override
    public List<TOrders> getAll() {
        return mapper.getAll();
    }

    @Override
    public List<TOrders> search_name(Integer select, Integer statu, String date) {
        return mapper.search_name(select, statu, date);
    }

    @Override
    public List<TOrdersDetail> Select_ByID(Integer id) {
        return mapper.Select_ByID(id);
    }

    @Override
    public List<TOrdersDetail> Select_ByID_User(Integer id) {
        return mapper.Select_ByID_User(id);
    }
}
