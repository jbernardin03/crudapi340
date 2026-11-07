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
<#if successMessage??>
    <h3>${successMessage}</h3>
</#if>
<div class="container">

    <form class="search-bar" action="/" method="get">

        <input
                type="text"
                name="name"
                placeholder="Search characters..."
                value="${name!''}">

        <select name="universe">

            <option value="">
                All Categories
            </option>

            <option value="Pirates">
                Pirates
            </option>

            <option value="Revolutionary">
                Revolutionary
            </option>

            <option value="Marine">
                Marine
            </option>

            <option value="Cross Guild">
                Cross Guild
            </option>

        </select>

        <button type="submit">
            Search
        </button>

    </form>

    <#if successMessage??>

        <h2>${successMessage}</h2>

    </#if>

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

                    <a href="/character/${character.characterId}">
                        View Details
                    </a>

                </div>

            </#list>

        </div>

    </#if>

</div>

</body>
</html>