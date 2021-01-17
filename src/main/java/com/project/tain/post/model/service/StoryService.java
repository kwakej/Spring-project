package com.project.tain.post.model.service;

import java.util.List;

import com.project.tain.post.model.domain.Story;

public interface StoryService {

	void storyInsert(Story st);

	List<Story> showMyStory(String m_id);

	int deleteStory(Story st);

	Story showAllStory(String m_id);

	Story showAllAStory();

	List<Story> storyResult(Story st);

	List<Story> eachStory(String id);
}
