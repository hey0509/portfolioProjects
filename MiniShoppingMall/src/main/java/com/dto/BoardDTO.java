package com.dto;

import java.util.Date;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("BoardDTO")
public class BoardDTO {

	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
}
