package com.dejavu.backend.jobNotices.domain.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class JobNoticesPageResponseDTO<T> {

	private List<T> content;
	private int page;
	private int size;
	private long totalElements;
}
