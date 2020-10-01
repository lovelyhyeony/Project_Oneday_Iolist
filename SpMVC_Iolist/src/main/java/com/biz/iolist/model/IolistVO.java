package com.biz.iolist.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class IolistVO {

    private long seq;//	NUMBER PRIMARY KEY,
    private String io_date;//	VARCHAR2(10),
    private String io_time;//	VARCHAR2(10),
    private boolean io_input;// CHAR(1) DEFAULT '1' CONSTRAINT input_veri CHECK(io_input = '1' OR io_input = '2'),
    private String io_pname;// nVARCHAR2(30) NOT NULL,
    private int io_price;// NUMBER,
    private int io_quan;//	NUMBER
    
    private int io_iprice_total; // 매입 총합계
    private int io_oprice_total; // 매출 총합계
    
    private int io_iprice; // 매입
    private int io_iprice_multi; // 매입 * 수량
    private int io_oprice; // 매출
    private int io_oprice_multi; // 매출 * 수량
}
