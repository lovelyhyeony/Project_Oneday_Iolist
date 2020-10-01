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

	private List<IolistVO> calcIolist(List<IolistVO> iolist) {
		int oSum = 0;
		int iSum = 0;
		for (IolistVO ioVO : iolist) {
			int price = ioVO.getIo_price();
			// 구분 1이면
			if (ioVO.isIo_input()) {
				// 매출에 값을 set
				ioVO.setIo_oprice(price);

				// 매출 * 수량
				ioVO.setIo_oprice_multi(price * ioVO.getIo_quan());

				// 매출합계 구하는 코드
				oSum += ioVO.getIo_oprice_multi();
				ioVO.setIo_oprice_total(oSum);
			} else {
				// 0이면 매입에 값을 set
				ioVO.setIo_iprice(price);

				// 매입 * 수량
				ioVO.setIo_iprice_multi(price * ioVO.getIo_quan());

				// 매입합계 구하는 코드
				iSum += ioVO.getIo_iprice_multi();
				ioVO.setIo_iprice_total(iSum);
			}
		}

		return iolist;
	}

	private IolistVO calcVO(IolistVO ioVO) {

		int price = ioVO.getIo_price();
		if (ioVO.isIo_input()) {
			ioVO.setIo_oprice(price);
		} else {
			ioVO.setIo_iprice(price);
		}

		return ioVO;
	}

	@Override
	public List<IolistVO> selectAll() {
		List<IolistVO> list = iolistDao.selectAll();
		return this.calcIolist(list);
	}

	@Override
	public IolistVO findBySeq(long seq) {
		return calcVO(iolistDao.findBySeq(seq));
	}

	@Override
	public int insert(IolistVO iolistVO) {
		int ret = iolistDao.insert(iolistVO);
		if (ret > 0) {
			log.debug("INSERT 성공 {}개 데이터 추가", ret);
		} else {
			log.debug("INSERT 실패 {}", ret);
		}
		return 0;
	}

	@Override
	public int update(IolistVO iolistVO) {
		// TODO Auto-generated method stub
		return iolistDao.update(iolistVO);
	}

	@Override
	public int delete(long seq) {
		// TODO Auto-generated method stub
		return iolistDao.delete(seq);
	}

}
