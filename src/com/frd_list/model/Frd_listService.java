package com.frd_list.model;

import java.util.ArrayList;
import java.util.List;

import com.frd_list.model.Frd_listDAO;
import com.frd_list.model.Frd_listDAO_interface;
import com.frd_list.model.Frd_listVO;

public class Frd_listService {
	private Frd_listDAO_interface dao;

	public Frd_listService() {
		dao = new Frd_listDAO();
	}

	//新增好友
	public Frd_listVO addFrd_list(String mem_no, String friend_no, String friend_chk) {

		Frd_listVO frd_listVOActive = new Frd_listVO();
//		Frd_listVO frd_listVOPassive = new Frd_listVO();
		
		
		frd_listVOActive.setMem_no(mem_no);
		frd_listVOActive.setFriend_no(friend_no);
		frd_listVOActive.setFriend_chk(friend_chk);
		dao.insert(frd_listVOActive);
		
//		frd_listVOPassive.setMem_no(friend_no);
//		frd_listVOPassive.setFriend_no(mem_no);
//		frd_listVOPassive.setFriend_chk("0");
//		dao.insert(frd_listVOPassive);
		
		return frd_listVOActive;
	}

	public Frd_listVO updateFrd_list(String mem_no, String friend_no, String friend_chk) {

		Frd_listVO frd_listVO = new Frd_listVO();

		frd_listVO.setMem_no(mem_no);
		frd_listVO.setFriend_no(friend_no);
		frd_listVO.setFriend_chk(friend_chk);
		dao.update(frd_listVO);

		return frd_listVO;
	}

	public void deleteFrd_list(String mem_no) {
		dao.delete(mem_no);
	}
	
	public void deleteOneFrd_list(Frd_listVO frd_listVO){
		dao.deleteOne(frd_listVO);
	}
	
	//Frd_listVO frd_listVO5 = dao.findByTwoPrimaryKey("M00000001","M00000003");
	public Frd_listVO findByTwoPrimaryKey(String mem_no, String friend_no){
		return dao.findByTwoPrimaryKey(mem_no, friend_no);
	}
	
	public Frd_listVO getOneFrd_list(String mem_no) {
		return dao.findByPrimaryKey(mem_no);
	}
	
	public List<Frd_listVO> getAllByMem_noFrd_list(String mem_no) {
		return dao.findByMem_no(mem_no);
	}
	
	public List<Frd_listVO> getAll() {
		return dao.getAll();
	}
	//相同方法使用新的方法名
	public List<Frd_listVO> getFriendsByMem_no(String mem_no) {
		return dao.findByMem_no(mem_no);
	}
	//得到已經是朋友
	public List<Frd_listVO> getMyFriends(String mem_no) {
		
		List<Frd_listVO> list = dao.findByMem_no(mem_no); 
		List<Frd_listVO> list2 = new ArrayList<Frd_listVO>();
		
		for(Frd_listVO aFriend:list){
			if(aFriend.getFriend_chk().equals("2")){
				list2.add(aFriend);
			}
		}
		
		return list2;
	}
	
	//得到被邀請
	public List<Frd_listVO> getInvited(String mem_no) {
		
		List<Frd_listVO> list = dao.findByMem_no(mem_no); 
		List<Frd_listVO> list2 = new ArrayList<Frd_listVO>();
		
		for(Frd_listVO aFriend:list){
			if(aFriend.getFriend_chk().equals("0")){
				list2.add(aFriend);
			}
		}
		
		return list2;
	}
	
	//得到邀請中好友
	public List<Frd_listVO> getInviteFriend(String mem_no) {
		
		List<Frd_listVO> list = dao.findByMem_no(mem_no); 
		List<Frd_listVO> list2 = new ArrayList<Frd_listVO>();
		
		for(Frd_listVO aFriend:list){
			if(aFriend.getFriend_chk().equals("1")){
				list2.add(aFriend);
			}
		}
		
		return list2;
	}
	
	
	
	
	public Frd_listVO getOneFriend(String mem_no, String friend_no){
		return dao.findByTwoPrimaryKey(mem_no, friend_no);
	}
	
	public void deleteOneFriend(Frd_listVO frd_listVO){
		dao.deleteOne(frd_listVO);
	}
	
	
}
