package com.project.tain.post.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.post.model.dao.SearchListDao;
import com.project.tain.post.model.domain.SearchList;

@Service("sService")
public class SearchListImpl implements SearchListService {

	@Autowired
	private SearchListDao sDao;

	@Override
	public List<SearchList> showHashTag(String hashtag) {
		return sDao.showHashTag(hashtag);
	}

}
