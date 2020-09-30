package com.biz.iolist.mapper;

import java.util.List;

import com.biz.iolist.model.IolistVO;

public interface IolistDao {

	public List<IolistVO> selectAll();
	public IolistVO findBySeq(long seq);
	
	public int insert(IolistVO iolistVO);
	public int update(IolistVO iolistVO);
	public int delete(IolistVO iolistVO);
}
