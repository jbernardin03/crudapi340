package com.example.demo.repository;

import com.example.demo.entity.TvCharacter;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface TvCharacterRepository extends JpaRepository<TvCharacter, Long> {
    List<TvCharacter> findByUniverseIgnoreCase(String universe);
    List<TvCharacter> findByNameContainingIgnoreCase(String name);
}

