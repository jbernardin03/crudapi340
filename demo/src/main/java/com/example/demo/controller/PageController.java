package com.example.demo.controller;

import com.example.demo.entity.TvCharacter;
import com.example.demo.service.TvCharacterService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PageController {

    private final TvCharacterService service;

    public PageController(TvCharacterService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String gallery(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String universe,
            Model model) {

        model.addAttribute(
                "characters",
                service.getAll(universe, name));

        model.addAttribute("name", name);
        model.addAttribute("universe", universe);

        return "index";
    }

    @GetMapping("/characters/{id}")
    public String details(
            @PathVariable Long id,
            Model model) {

        try {

            model.addAttribute(
                    "character",
                    service.getById(id));

            return "details";

        } catch (RuntimeException e) {

            return "not-found";
        }
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/characters/new")
    public String addForm(Model model) {

        model.addAttribute(
                "character",
                new TvCharacter());

        return "character-form";
    }

    @PostMapping("/characters")
    public String addCharacter(
            @ModelAttribute TvCharacter character,
            RedirectAttributes ra) {

        service.create(character);

        ra.addFlashAttribute(
                "successMessage",
                character.getName() + " was added.");

        return "redirect:/";
    }

    @GetMapping("/characters/{id}/edit")
    public String editForm(
            @PathVariable Long id,
            Model model) {

        try {

            model.addAttribute(
                    "character",
                    service.getById(id));

            return "character-form";

        } catch (RuntimeException e) {

            return "not-found";
        }
    }

    @PostMapping("/characters/{id}")
    public String editCharacter(
            @PathVariable Long id,
            @ModelAttribute TvCharacter character,
            RedirectAttributes ra) {

        service.update(id, character);

        ra.addFlashAttribute(
                "successMessage",
                character.getName() + " was updated.");

        return "redirect:/characters/" + id;
    }

    @PostMapping("/characters/{id}/delete")
    public String deleteCharacter(
            @PathVariable Long id,
            RedirectAttributes ra) {

        try {

            TvCharacter character =
                    service.getById(id);

            service.delete(id);

            ra.addFlashAttribute(
                    "successMessage",
                    character.getName() + " was removed.");

            return "redirect:/";

        } catch (RuntimeException e) {

            return "not-found";
        }
    }
}