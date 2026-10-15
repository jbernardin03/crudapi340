package com.example.demo.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.time.LocalDate;

@Entity
@Table(name = "characters")
public class TvCharacter {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long characterId;

    @NotBlank
    private String name;

    @NotBlank
    @Column(length = 1000)
    private String description;

    // Your extra attributes
    @NotBlank
    private String universe;

    @NotBlank
    private String role;

    private LocalDate firstAppearance;

    // Getters and setters

    public Long getCharacterId() {
        return characterId;
    }

    public void setCharacterId(Long characterId) {
        this.characterId = characterId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUniverse() {
        return universe;
    }

    public void setUniverse(String universe) {
        this.universe = universe;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public LocalDate getFirstAppearance() {
        return firstAppearance;
    }

    public void setFirstAppearance(LocalDate firstAppearance) {
        this.firstAppearance = firstAppearance;
    }
}
