package dao;

import pojo.ItemsCustom;
import pojo.ItemsQueryVo;

import java.util.List;


/**
 * 商品自定义mapper
 */
public interface ItemsMapperCustom {
	// 商品查询列表
	List<ItemsCustom> findItemsList(ItemsQueryVo itemsQueryVo)
			throws Exception;

}
