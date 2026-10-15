package com.example.demo.controller;

import com.example.demo.entity.TvCharacter;
import com.example.demo.service.TvCharacterService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/characters")
public class TvCharacterController {

    private final TvCharacterService service;

    public TvCharacterController(TvCharacterService service) {
        this.service = service;
    }

    @GetMapping
    public List<TvCharacter> getAll(@RequestParam(required = false) String universe,
                                    @RequestParam(required = false) String name) {
        return service.getAll(universe, name);
    }

    @GetMapping("/{id}")
    public ResponseEntity<TvCharacter> getById(@PathVariable Long id) {
        try {
            return ResponseEntity.ok(service.getById(id));
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @PostMapping
    public ResponseEntity<TvCharacter> create(@Valid @RequestBody TvCharacter character) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.create(character));
    }

    @PutMapping("/{id}")
    public ResponseEntity<TvCharacter> update(@PathVariable Long id,
                                              @Valid @RequestBody TvCharacter character) {
        try {
            return ResponseEntity.ok(service.update(id, character));
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        try {
            service.delete(id);
            return ResponseEntity.noContent().build();
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<String> handleValidation(MethodArgumentNotValidException ex) {
        return ResponseEntity.badRequest().body("Validation failed: name and description are required.");
    }
}

