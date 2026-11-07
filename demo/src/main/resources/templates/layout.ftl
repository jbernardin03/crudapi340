<#macro page title>

<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<header>

    <h1>One Piece Character Gallery</h1>

    <nav>
        <a href="/">Home</a>
        <a href="/about">About</a>
        <a href="/characters/new">Add Character</a>
    </nav>

</header>

<div class="container">

    <#if successMessage??>
        <div class="success-message">
            ${successMessage}
        </div>
    </#if>

    <#nested>

</div>

</body>
</html>

</#macro>