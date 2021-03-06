package cn.weicao.mxr.dao;

import java.util.List;
import java.util.Map;

import cn.weicao.mxr.vo.UCGoods;

public interface IUCGoodsDAO {
	/**
	 * 根据半成品名称查找半成品信息
	 * @param name 半成品名称
	 * @return 半成品信息
	 */
	public UCGoods findByName(String name) ;
	/**
	 * 增加半成品
	 * @param ucgoods 半成品信息
	 * @return 增加成功返回true
	 */
	public boolean doCreate(UCGoods ucgoods) ;
	/**
	 * 时间分页模糊查询
	 * @param map 有时间分页模糊数据
	 * @return 返回查询的结果
	 */
	public List<UCGoods> findSplit(Map<String,Object> map) ;
	/**
	 * 时间模糊查询的数据量
	 * @param map 有时间模糊参数
	 * @return 数据量
	 */
	public int getCount(Map<String,Object> map) ;
	/**
	 * 根据半成品编号查询半成品信息
	 * @param ucid 半成品编号
	 * @return 半成品信息
	 */
	public UCGoods findById(Integer ucid) ;
	/**
	 * 根据半成品编号修改半成品信息
	 * @param ucid 半成品编号
	 * @return 修改成功返回true
	 */
	public boolean doEdit(UCGoods ucgoods) ;
	/**
	 * 模糊查询
	 * @param keyWord 模糊查询的关键字
	 * @return 所有满足条件的半成品信息
	 */
	public List<UCGoods> findByLike(String keyWord) ;
}
