package pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TOrdersDetail {

  private int id;
  private int order_id;
  private String pro_name;
  private String pro_unit;
  private TProvider provider_id;
  private int wholesale_price;
  private int retail_price;
  private int sale_price;
  private int sale_number;

  private String contact_person;
  private String create_time;



}
