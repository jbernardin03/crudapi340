<!DOCTYPE html>
<html>
<head>
    <title>One Piece Character Gallery</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<header>
    <h1>One Piece Character Gallery</h1>

    <nav>
        <a href="/">Home</a>
        <a href="/about">About</a>
        <a href="/characters/add">Add Character</a>
    </nav>
</header>

<div class="container">

    <form class="search-bar" action="/" method="get">

        <input
            type="text"
            name="name"
            placeholder="Search characters..."
            value="${name!''}">

        <div class="filter-buttons">

            <button type="submit" name="universe" value="Pirates">
                Pirates
            </button>

            <button type="submit" name="universe" value="Revolutionary">
                Revolutionary
            </button>

            <button type="submit" name="universe" value="Marine">
                Marine
            </button>

            <button type="submit" name="universe" value="Cross Guild">
                Cross Guild
            </button>

        </div>
    </form>

    <div class="gallery">

        <#list characters as character>

        <div class="card">

            <img
                src="${character.imageUrl!'/images/chopper.jpg'}"
                alt="${character.name}">

            <h3>${character.name}</h3>

            <p><strong>Role:</strong> ${character.role}</p>

            <p>${character.description}</p>

            <p><strong>Category:</strong> ${character.universe}</p>

            <a href="/character/${character.characterId}">
                View Details
            </a>

        </div>

        </#list>

    </div>

</div>

</body>
</html>