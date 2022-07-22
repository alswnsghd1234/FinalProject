package com.payalot.enjoyforott.favor.model.dao;


import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class favorDao {

	public int favor(SqlSessionTemplate sqlSession, HashMap<String,Object> good) {
		
		return sqlSession.insert("favormapper.insertfavor",good);
	}

	public int notfavor(SqlSessionTemplate sqlSession, HashMap<String, Object> good) {

		
		return sqlSession.delete("favormapper.deletefavor",good);
	}

}
