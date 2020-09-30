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
    private String io_input;// CHAR(1) DEFAULT '1' CONSTRAINT input_veri CHECK(io_input = '1' OR io_input = '2'),
    private String io_pname;// nVARCHAR2(30) NOT NULL,
    private int io_price;// NUMBER,
    private int io_quan;//	NUMBER,
    private int io_total;// NUMBER
}
