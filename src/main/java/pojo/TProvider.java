package pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TProvider {

  private int id;
  private String provider_name;
  private String contact_person;
  private String contact_phone;


}
