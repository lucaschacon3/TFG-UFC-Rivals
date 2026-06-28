package com.example.web.controllers;


import com.example.web.services.OpenAIClientService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/openai")
public class OpenAIController {


    private final OpenAIClientService openAIService;

    public OpenAIController(OpenAIClientService openAIService) {
        this.openAIService = openAIService;
    }

    @PostMapping("/chat")
    public ResponseEntity<String> chat(@RequestBody Map<String, String> body) {
        String prompt = body.get("prompt");

        try {
            String response = openAIService.getChatCompletion(prompt);
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            System.err.println("Error in /chat: " + e.getMessage());

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error while processing chat request: " + e.getMessage()+" reload the page please");
        }
    }

}
