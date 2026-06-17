package com.example.web.controllers;

import com.example.web.services.OllamaClientService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/ai")
public class OpenAIController {

    private static final Logger log = LoggerFactory.getLogger(OpenAIController.class);

    private final OllamaClientService ollamaService;

    public OpenAIController(OllamaClientService ollamaService) {
        this.ollamaService = ollamaService;
    }

    @PostMapping("/chat")
    public ResponseEntity<String> chat(@RequestBody Map<String, String> body) {
        String prompt = body.get("prompt");

        try {
            String response = ollamaService.getChatCompletion(prompt);
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            log.error("Error in /chat: {}", e.getMessage(), e);

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error while processing chat request: " + e.getMessage() + " reload the page please");
        }
    }

}
