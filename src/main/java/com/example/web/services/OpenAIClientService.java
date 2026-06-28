package com.example.web.services;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import java.util.List;
import java.util.Map;

@Service
public class OpenAIClientService {

    private final WebClient webClient;
    private final String apiKey;

    public OpenAIClientService(@Value("${openai.api.key}") String apiKey) {
        this.webClient = WebClient.builder().baseUrl("https://api.openai.com/v1").build();
        this.apiKey = apiKey;
    }

    public String getChatCompletion(String prompt) {
        Map<String, Object> requestBody = Map.of(
                "model", "gpt-3.5-turbo",
                "messages", List.of(Map.of("role", "user", "content", prompt))
        );

        Mono<Map> response = webClient.post()
                .uri("/chat/completions")
                .header("Authorization", "Bearer " + apiKey)
                .header("Content-Type", "application/json")
                .bodyValue(requestBody)
                .retrieve()
                .bodyToMono(Map.class);

        Map body = response.block();

        if (body != null && body.containsKey("choices")) {
            List choices = (List) body.get("choices");
            if (!choices.isEmpty()) {
                Map choice = (Map) choices.get(0);
                Map message = (Map) choice.get("message");
                return (String) message.get("content");
            }
        }

        return "No OpenAI response received";
    }
}
