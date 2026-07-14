package com.dejavu.backend.ai.client;

import com.dejavu.backend.ai.domain.JobAiAnalysisPrompt;
import com.dejavu.backend.ai.dto.AiAnalysisResponse;

public interface JobAiAnalysisClient {

	AiAnalysisResponse.AiAnalysis analyze(JobAiAnalysisPrompt prompt);
}
