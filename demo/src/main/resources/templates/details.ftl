<#import "layout.ftl" as layout>

<@layout.page title=character.name>

<a href="/">Back to Gallery</a>

<br><br>

<img
    src="${character.imageUrl!'/images/chopper.jpg'}"
    class="details-img"
    alt="${character.name}">

<h2>${character.name}</h2>

<p>
    <strong>Description:</strong>
    ${character.description}
</p>

<p>
    <strong>Universe:</strong>
    ${character.universe}
</p>

<p>
    <strong>Role:</strong>
    ${character.role}
</p>

<p>
    <strong>First Appearance:</strong>
    ${character.firstAppearance!''}
</p>

<br>

<a href="/characters/${character.characterId?c}/edit">
    Edit Character
</a>

<br><br>

<form
    method="post"
    action="/characters/${character.characterId?c}/delete">

    <button
        type="submit"
        onclick="return confirm('Delete this character?')">

        Delete Character

    </button>

</form>

</@layout.page>