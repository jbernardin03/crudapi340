<#import "layout.ftl" as layout>

<@layout.page title="Character Form">

<div style="display:flex; justify-content:center; gap:30px; margin-bottom:40px; flex-wrap:wrap;">

    <div class="card" style="max-width:300px;">
        <img src="/images/chopper.jpg" alt="Tony Tony Chopper">
        <h3>Tony Tony Chopper</h3>
        <p>Doctor of the Straw Hat Pirates</p>
    </div>

    <div class="card" style="max-width:300px;">
        <img src="/images/dragon.webp" alt="Monkey D. Dragon">
        <h3>Monkey D. Dragon</h3>
        <p>Leader of the Revolutionary Army</p>
    </div>

</div>

<form method="post">

    <label>Name</label>

    <input
        type="text"
        name="name"
        value="${character.name!''}"
        required>

    <label>Description</label>

    <textarea
        name="description"
        required>${character.description!''}</textarea>

    <label>Universe</label>

    <input
        type="text"
        name="universe"
        value="${character.universe!''}"
        required>

    <label>Role</label>

    <input
        type="text"
        name="role"
        value="${character.role!''}"
        required>

    <label>Image URL</label>

    <input
        type="text"
        name="imageUrl"
        value="${character.imageUrl!''}">

    <label>First Appearance</label>

    <input
        type="date"
        name="firstAppearance"
        value="${character.firstAppearance!''}">

    <button type="submit">

        Save Character

    </button>

</form>

</@layout.page>