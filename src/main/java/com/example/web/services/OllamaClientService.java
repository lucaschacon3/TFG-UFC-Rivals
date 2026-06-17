package com.example.web.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.time.Duration;
import java.util.List;
import java.util.Map;

@Service
public class OllamaClientService {

    private static final Logger log = LoggerFactory.getLogger(OllamaClientService.class);

    private final RestTemplate restTemplate;
    private final String model;

    public OllamaClientService(
            @Value("${ollama.api.url:http://localhost:11434}") String baseUrl,
            @Value("${ollama.model:llama3}") String model
    ) {
        this.restTemplate = new RestTemplateBuilder()
                .rootUri(baseUrl)
                .setConnectTimeout(Duration.ofSeconds(10))
                .setReadTimeout(Duration.ofSeconds(120))
                .build();
        this.model = model;
    }

    public String getChatCompletion(String prompt) {
        Map<String, Object> requestBody = Map.of(
                "model", model,
                "stream", false,
                "messages", List.of(
                        Map.of("role", "system", "content", "Respond in 1-2 sentences. Be concise."),
                        Map.of("role", "user", "content", prompt)
                )
        );

        log.info("Sending request to Ollama (model={})", model);

        Map body = restTemplate.postForObject("/api/chat", requestBody, Map.class);

        if (body != null && body.containsKey("message")) {
            Map message = (Map) body.get("message");
            String content = (String) message.get("content");
            log.info("Ollama response received ({} chars)", content != null ? content.length() : 0);
            return content;
        }

        log.warn("Unexpected Ollama response: {}", body);
        return "No response received from Ollama";
    }
}
