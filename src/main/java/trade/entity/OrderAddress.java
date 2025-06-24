package trade.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


@Data
public class OrderAddress  implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;

    private Long orderId;

    private String consigneeName;

    private String consigneePhone;

    private String detailAddress;

}
