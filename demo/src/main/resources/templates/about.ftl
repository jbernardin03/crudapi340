<#import "layout.ftl" as layout>

<@layout.page title="About">

<img
    src="/images/onepiece.png"
    alt="One Piece"
    style="width:250px; border-radius:10px;">

<h2>Welcome to the One Piece Character Gallery</h2>

<p>
    This website showcases characters from the world of One Piece.
    The goal is to provide information, images, and character details
    through a searchable gallery.
</p>

<h2>Design Choices</h2>

<p>
    The gallery uses cards, character images,
    and simple navigation to provide a clean user experience.
</p>

<h2>How This Application Works</h2>

<p>
    This application uses Spring Boot,
    PostgreSQL, FreeMarker templates,
    a Service layer, and a Repository layer.
</p>

<p>
    A controller receives requests,
    retrieves character data through the service layer,
    and displays it using FreeMarker templates.
</p>

</@layout.page>