package trade.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


@Data
public class Favorite implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 自增主键id
     */
    private Long id;

    /**
     * 加入收藏的时间
     */
    private Date createTime;

    /**
     * 用户主键id
     */
    private Long userId;

    /**
     * 闲置物主键id
     */
    private Long idleId;

    private IdleItem idleItem;



}
