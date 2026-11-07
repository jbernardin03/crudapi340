package com.example.demo.service;

import com.example.demo.entity.TvCharacter;
import com.example.demo.repository.TvCharacterRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TvCharacterService {

    private final TvCharacterRepository repository;

    public TvCharacterService(TvCharacterRepository repository) {
        this.repository = repository;
    }

    public List<TvCharacter> getAll(String universe, String name) {

    boolean hasUniverse =
            universe != null && !universe.isBlank();

    boolean hasName =
            name != null && !name.isBlank();

    if (hasUniverse && hasName) {

        return repository
                .findByNameContainingIgnoreCaseAndUniverseIgnoreCase(
                        name,
                        universe);
    }

    if (hasUniverse) {
        return repository.findByUniverseIgnoreCase(universe);
    }

    if (hasName) {
        return repository.findByNameContainingIgnoreCase(name);
    }

    return repository.findAll();
}

    public TvCharacter getById(Long id) {

        return repository.findById(id)
                .orElseThrow(() ->
                        new RuntimeException("Character not found"));
    }

    public TvCharacter create(TvCharacter character) {
        return repository.save(character);
    }

    public TvCharacter update(Long id, TvCharacter updated) {

        TvCharacter existing = getById(id);

        existing.setName(updated.getName());
        existing.setDescription(updated.getDescription());
        existing.setUniverse(updated.getUniverse());
        existing.setRole(updated.getRole());
        existing.setFirstAppearance(updated.getFirstAppearance());
        existing.setImageUrl(updated.getImageUrl());

        return repository.save(existing);
    }

    public void delete(Long id) {

        TvCharacter existing = getById(id);

        repository.delete(existing);
    }

    public List<TvCharacter> findAllCharacters() {
        return repository.findAll();
    }

    public List<TvCharacter> searchCharacters(
            String universe,
            String name) {

        return getAll(universe, name);
    }
}