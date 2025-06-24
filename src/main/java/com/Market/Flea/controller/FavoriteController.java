package com.Market.Flea.controller;

import com.Market.Flea.entity.Favorite;
import com.Market.Flea.enums.ErrorMsg;
import com.Market.Flea.service.FavoriteService;
import com.Market.Flea.vo.R;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;


@CrossOrigin
@RestController
@RequestMapping("/favorite")
public class FavoriteController {
    @Resource
    private FavoriteService favoriteService;

    /**
     * 添加收藏
     *
     * @param shUserId 用户id
     * @param favorite 收藏信息
     * @return 添加结果
     */
    @PostMapping("/add")
    public R addFavorite(
            @CookieValue("shUserId")
            @NotNull(message = "登录异常 请重新登录")
            @NotEmpty(message = "登录异常 请重新登录") String shUserId,
            @RequestBody Favorite favorite
    ) {
        favorite.setUserId(Long.valueOf(shUserId));
        favorite.setCreateTime(new Date());
        if (favoriteService.addFavorite(favorite)) {
            return R.success(favorite.getId());
        }
        return R.fail(ErrorMsg.FAVORITE_EXIT);
    }

    /**
     * 删除收藏
     *
     * @param id 收藏id
     * @return 结果
     */
    @GetMapping("/delete")
    public R deleteFavorite(
            @CookieValue("shUserId")
            @NotNull(message = "登录异常 请重新登录")
            @RequestParam Long id
    ) {
        if (favoriteService.deleteFavorite(id)) {
            return R.success();
        }
        return R.fail(ErrorMsg.SYSTEM_ERROR);
    }

    /**
     * 检查收藏状态
     *
     * @param shUserId 用户id
     * @param idleId   收藏id
     * @return 结果
     */
    @GetMapping("/check")
    public R checkFavorite(
            @CookieValue("shUserId")
            @NotNull(message = "登录异常 请重新登录")
            @NotEmpty(message = "登录异常 请重新登录") String shUserId,
            @RequestParam Long idleId
    ) {
        return R.success(favoriteService.isFavorite(Long.valueOf(shUserId), idleId));
    }

    /**
     * 我的收藏
     *
     * @param shUserId 用户d
     * @return 收藏列表
     */
    @GetMapping("/my")
    public R getMyFavorite(
            @CookieValue("shUserId")
            @NotNull(message = "登录异常 请重新登录")
            @NotEmpty(message = "登录异常 请重新登录") String shUserId
    ) {
        return R.success(favoriteService.getAllFavorite(Long.valueOf(shUserId)));
    }
}
