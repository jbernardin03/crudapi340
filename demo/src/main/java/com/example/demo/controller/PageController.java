package com.example.demo.controller;

import com.example.demo.entity.TvCharacter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.example.demo.service.TvCharacterService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/character/{id}")
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

    @GetMapping("/characters/add")
    public String addForm(Model model) {

        model.addAttribute(
                "character",
                new TvCharacter());

        return "new-character-form";
    }

    @PostMapping("/characters/add")
public String addCharacter(
        @ModelAttribute TvCharacter character,
        RedirectAttributes ra) {

    service.create(character);

    ra.addFlashAttribute(
            "successMessage",
            character.getName() + " was added.");

    return "redirect:/";
}

    @GetMapping("/characters/edit/{id}")
    public String editForm(
            @PathVariable Long id,
            Model model) {

        try {

            model.addAttribute(
                    "character",
                    service.getById(id));

            return "new-character-form";

        } catch (RuntimeException e) {

            return "not-found";
        }
    }

    @PostMapping("/characters/edit/{id}")
public String editCharacter(
        @PathVariable Long id,
        @ModelAttribute TvCharacter character) {

    service.update(id, character);

    return "redirect:/character/" + id;
}

    @PostMapping("/characters/delete/{id}")
public String deleteCharacter(
        @PathVariable Long id,
        RedirectAttributes ra) {

    TvCharacter character =
            service.getById(id);

    service.delete(id);

    ra.addFlashAttribute(
            "successMessage",
            character.getName() + " was removed.");

    return "redirect:/";
}
}