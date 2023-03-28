package pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TOrders {

  private int id;
  private TOrganization org_id;
  private String create_user;
  private String create_time;
  private int pro_number;
  private int statu;
  private String predict_time;


}
