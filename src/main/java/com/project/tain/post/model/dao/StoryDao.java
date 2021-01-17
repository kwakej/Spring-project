package com.project.tain.post.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.post.model.domain.Story;
import com.project.tain.post.model.domain.TimeLine;

@Repository("yDao")
public class StoryDao {
	@Autowired
	private SqlSession sqlSession;

	public int storyInsert(Story st) {
		return sqlSession.insert("Story.storyInsert", st);
	}
	
	public List<Story> showMyStory(String m_id){
		return sqlSession.selectList("Story.showMyStory", m_id);
	}
	
	public int deleteStory(Story st) {
		return sqlSession.delete("Story.deleteStory", st);
	}
	
	public Story showAllStory(String m_id){
		return sqlSession.selectOne("Story.showAllStory", m_id);
	}
	public Story showAllAStory(){
		return sqlSession.selectOne("Story.showAllAStory");
	}
	
	public List<Story> storyResult(Story st) {
		return sqlSession.selectList("Story.storyResult", st);
	}
	
	public List<Story> eachStory(String id) {
		return sqlSession.selectList("Story.eachStory", id);
	}

}
