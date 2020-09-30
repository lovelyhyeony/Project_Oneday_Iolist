package com.biz.iolist.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.biz.iolist.mapper.IolistDao;
import com.biz.iolist.model.IolistVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service(value = "iolistServiceV1")
@RequiredArgsConstructor
public class IolistServiceImplV1 implements IolistService {

	private final IolistDao iolistDao;

	@Override
	public List<IolistVO> selectAll() {
		return iolistDao.selectAll();
	}

	@Override
	public IolistVO findBySeq(long seq) {
		return iolistDao.findBySeq(seq);
	}

	@Override
	public int insert(IolistVO iolistVO) {
		int ret = iolistDao.insert(iolistVO);
		if(ret > 0) {
			log.debug("INSERT 성공 {}개 데이터 추가", ret);
		} else {
			log.debug("INSERT 실패 {}", ret);
		}
		return 0;
	}

	@Override
	public int update(IolistVO iolistVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(IolistVO iolistVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
