<!DOCTYPE html>
<html>
<head>
    <title>About This Gallery</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<header>

    <h1>About This Website</h1>

    <nav>
        <a href="/">Home</a>
        <a href="/about">About</a>
        <a href="/characters/add">Add Character</a>
    </nav>

</header>

<div class="container">

    <img
        src="/images/onepiece.png"
        alt="One Piece Image"
        style="width:250px; border-radius:10px;">

    <h2>Welcome to the One Piece Character Gallery</h2>

    <p>
        This website was created as a character-themed gallery inspired by the world of
        <strong>One Piece</strong>. The series is known for its massive cast of unique
        characters, each with their own personalities, abilities, and stories. Because of
        this variety, One Piece is a perfect choice for a character showcase project.
    </p>

    <h2>Design Choices</h2>

    <p>
        The layout is simple and clean, focusing on character cards with easy navigation.
        Each page uses consistent styling through a shared CSS file, keeping the site
        visually unified. The gallery highlights characters such as Zoro, Mihawk,
        Jimbei, Loki, and Crocodile.
    </p>

   <h2>How This Application Works</h2>

<p>
This application uses Spring Boot for the backend,
PostgreSQL for data storage, and FreeMarker templates
for rendering webpages. Requests are handled by
controllers, business logic is managed by the service
layer, and character information is stored and retrieved
through the repository layer.
</p>

<p>
The frontend communicates with the backend by sending
requests to Spring Boot controllers. Those controllers
retrieve data from the database and display it through
FreeMarker templates.
</p>

</div>

</body>
</html>