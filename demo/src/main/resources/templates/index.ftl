<#import "layout.ftl" as layout>

<@layout.page title="One Piece Character Gallery">

<form class="search-bar" action="/" method="get">

    <input
            type="text"
            name="name"
            placeholder="Search characters..."
            value="${name!''}">

    <select name="universe">

        <option value="">All Categories</option>

        <option value="Pirates">Pirates</option>
        <option value="Revolutionary">Revolutionary</option>
        <option value="Marine">Marine</option>
        <option value="Cross Guild">Cross Guild</option>

    </select>

    <button type="submit">Search</button>

</form>

<#if characters?size == 0>

    <h2>No characters found.</h2>

<#else>

<div class="gallery">

<#list characters as character>

<div class="card">

    <img
        src="${character.imageUrl!'/images/chopper.jpg'}"
        alt="${character.name}">

    <h3>${character.name}</h3>

    <p>${character.role}</p>

    <p>${character.universe}</p>

    <p>${character.description}</p>

    <a href="/characters/${character.characterId?c}">
        View Details
    </a>

</div>

</#list>

</div>

</#if>

</@layout.page>