
# CRUD API — Character Back-End Web Service (CSC 340 Assignment #3)

This is a **Spring Boot REST API** that provides full CRUD functionality for fictional characters. It uses **PostgreSQL (provided by Neon)**, **Spring Data JPA**, **Validation**, and is deployed on **Render** using a Dockerized multi‑stage build.

This API is the backend for the Assignment 2 character website.

---

## Character Entity

 Entity includes the following:

| Attribute       | Type        | Rules / Description |
|-----------------|-------------|---------------------|
| `characterId`   | `long`      | Auto‑generated, unique ID |
| `name`          | `String`    | Required, not null, not blank |
| `description`   | `String`    | Required, not null, not blank |
| `universe`      | `String`    | extra attribute |
| `species`       | `String`    | extra attribute |

Database table (Neon):  
[https://console.neon.tech/app/projects/royal-field-43828381/branches/br-mute-wind-b5shnp4e/tables?database=neondb](https://console.neon.tech/app/projects/royal-field-43828381/branches/br-mute-wind-b5shnp4e/tables?database=neondb)

---

##  Base URL (Deployed API)

API is live at:

### **[https://crudapi340.onrender.com/api/characters]**

**Cold‑start note:**  
Free Render services sleep when idle.  
The **first request may take 60–120 seconds** to wake the server up.

---

##  API Endpoints

### **Characters API — `/api/characters`**

| Method | Path | Description | Success Status |
|--------|------|-------------|----------------|
| GET | `/api/characters` | Get all characters | **200 OK** |
| GET | `/api/characters/{id}` | Get one character by ID | **200 OK** |
| POST | `/api/characters` | Add a new character | **201 Created** |
| PUT | `/api/characters/{id}` | Update an existing character | **200 OK** |
| DELETE | `/api/characters/{id}` | Delete a character | **204 No Content** |
| GET | `/api/characters?universe=Marvel` | Filter by universe | **200 OK** |
| GET | `/api/characters?name=abc` | Search by partial name | **200 OK** |

---

##  Example Request Bodies

### **POST — Create a Character**

```json
{
  "name": "Monkey D. Luffy",
  "description": "Captain of the Straw Hat Pirates",
  "universe": "One Piece",
  "species": "Human"
}
```

### **PUT — Update a Character**

```json
{
  "name": "Monkey D. Luffy",
  "description": "Future Pirate King",
  "universe": "One Piece",
  "species": "Human"
}
```

---

##  Deployment Notes

- The app is containerized using a **multi‑stage Dockerfile**.
- Environment variable (`SPRING_DATASOURCE_URL`) are configured in Render.
- The app listens on the port provided by Render using:
  ```
  server.port=${PORT:8080}
  ```
