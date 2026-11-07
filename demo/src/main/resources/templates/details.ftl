<!DOCTYPE html>
<html>
<head>
    <title>${character.name}</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<header>
    <h1>${character.name}</h1>

    <nav>
        <a href="/">Home</a>
        <a href="/about">About</a>
        <a href="/characters/add">Add Character</a>
    </nav>
</header>

<div class="container">

    <img
        src="${character.imageUrl!'/images/Zoro-onepiece.webp'}"
        class="details-img"
        alt="${character.name}">

    <h2>Description</h2>

    <p>
        ${character.description}
    </p>

    <h2>Universe / Affiliation</h2>

    <p>
        ${character.universe}
    </p>

    <h2>Role</h2>

    <p>
        ${character.role}
    </p>

    <h2>First Appearance</h2>

    <p>
        ${character.firstAppearance!''}
    </p>

    <br>

    <a href="/characters/edit/${character.characterId}">
        Edit Character
    </a>

    <br><br>

    <br><br>

<a href="/characters/edit/${character.characterId}">
    Edit Character
</a>

<br><br>

    <form
        method="post"
        action="/characters/delete/${character.characterId}">

        <button
            type="submit"
            onclick="return confirm('Delete this character?')">

            Delete Character

        </button>

    </form>

</div>

</body>
</html>