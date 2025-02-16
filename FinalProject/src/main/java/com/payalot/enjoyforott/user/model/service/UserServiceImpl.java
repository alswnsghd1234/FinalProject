package com.payalot.enjoyforott.user.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payalot.enjoyforott.common.model.vo.UpdateScore;
import com.payalot.enjoyforott.user.model.dao.UserDao;
import com.payalot.enjoyforott.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public User loginUser(User u) {
		return userDao.loginUser(sqlSession,u);
	}

	@Override
	public int joinUser(User u) {
		return userDao.joinUser(sqlSession, u);
	}

	//회원정보 수정
	@Override
	public int updateUser(User u) {
		
		int result = userDao.updateUser(sqlSession,u);
		
		return result;
	}

	//회원정보 삭제
	@Override
	public int deleteUser(String userId) {
		
		int result = userDao.deleteUser(sqlSession,userId);
		
		return result;
	}

	@Override
	public int idCheck(String checkId) {
		return userDao.idCheck(sqlSession, checkId);
	}

	@Override
	public int nicknameCheck(String checkNickname) {
		return userDao.nicknameCheck(sqlSession, checkNickname);
	}

	@Override
	public int updateUserScore(UpdateScore us) {
		return userDao.updateUserScore(sqlSession, us);
	}

}
