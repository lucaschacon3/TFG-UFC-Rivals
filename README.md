![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Java](https://img.shields.io/badge/java-21-blue.svg)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.4.4-green.svg)
![Docker](https://img.shields.io/badge/Docker-Compose-blue.svg)

# 🥊 UFC Rivals

**Full Stack Web App — Proyecto Final de Ciclo Formativo**

Plataforma web para el análisis y simulación de peleas de UFC, impulsada por inteligencia artificial local (Ollama). Los usuarios pueden registrarse, explorar luchadores, y generar predicciones interactivas con gráficos dinámicos y simulación narrativa generada por IA.

---

## 📑 Índice

1. [Capturas de pantalla](#-capturas-de-pantalla)
2. [Características principales](#-características-principales)
3. [Stack tecnológico](#-stack-tecnológico)
4. [Estructura del proyecto](#-estructura-del-proyecto)
5. [Guía de instalación](#-guía-de-instalación)
6. [Configuración](#-configuración)
7. [Recorrido por las páginas](#-recorrido-por-las-páginas)
8. [API REST](#-api-rest)
9. [Base de datos](#-base-de-datos)
10. [Seguridad](#-seguridad)
11. [Arquitectura Docker](#-arquitectura-docker)
12. [Personalización](#-personalización)
13. [Licencia](#-licencia)

---

## 📸 Capturas de pantalla

| Home | Fighters |
|:---:|:---:|
| *(captura pendiente)* | *(captura pendiente)* |
| **Simulator** | **Ranking** |
| *(captura pendiente)* | *(captura pendiente)* |

| Login / Register | User / Favorites |
|:---:|:---:|
| *(captura pendiente)* | *(captura pendiente)* |

---

## 🚀 Características principales

- **Arquitectura MVC con Thymeleaf** para renderizado dinámico del lado del servidor.
- **Autenticación segura** con Spring Security (form login clásico, contraseñas cifradas con BCrypt).
- **Simulaciones de peleas con IA local** usando **Ollama** (`llama3.2:3b`), sin depender de APIs externas ni costes recurrentes.
- **Visualización interactiva de estadísticas** con gráficos radar (Chart.js) comparativos entre dos luchadores.
- **Sistema de favoritos** — los usuarios pueden marcar luchadores y guardar peleas simuladas.
- **Búsqueda y ordenación** de luchadores con paginación y múltiples criterios de orden.
- **Ranking top 15** con diseño acordeón expandible.
- **Interfaz responsive y moderna** construida con Tailwind CSS.
- **Notificaciones y alertas** con SweetAlert2.
- **Despliegue completo con Docker Compose** — app, PostgreSQL y Ollama en contenedores.

---

## 🛠️ Stack tecnológico

| Capa | Tecnologías |
|------|------------|
| **Lenguaje** | Java 21 |
| **Framework** | Spring Boot 3.4.4, Spring MVC, Spring Data JDBC |
| **Seguridad** | Spring Security, BCrypt |
| **Frontend** | Thymeleaf, Tailwind CSS, Chart.js, SweetAlert2 |
| **Base de datos** | PostgreSQL 16 |
| **IA / LLM** | Ollama, modelo `llama3.2:3b` |
| **Contenedores** | Docker, Docker Compose V2 |
| **Construcción** | Maven 3.9+ (multistage Docker) |
| **Utilidades** | Lombok |

---

## 📂 Estructura del proyecto

```
TFG-UFC-Rivals/
├── Dockerfile                    # Multi-stage build (Maven → JRE)
├── docker-compose.yml            # 4 servicios: db, ollama, ollama-init, app
├── pom.xml
├── mvnw / mvnw.cmd               # Maven Wrapper
├── db/
│   └── init.sql                  # Schema + seed data (cargado por PostgreSQL al iniciar)
│
├── src/main/java/com/example/web/
│   ├── WebApplication.java
│   ├── controllers/
│   │   ├── MainController.java
│   │   ├── UserController.java
│   │   ├── FighterController.java
│   │   ├── SimulatorController.java
│   │   ├── OpenAIController.java
│   │   ├── RankingController.java
│   │   ├── FavoriteController.java
│   │   └── ErrorController.java
│   ├── dtos/
│   │   ├── FighterDto.java
│   │   ├── UserAppDto.java
│   │   ├── FavFighterDto.java
│   │   └── FavFightDto.java
│   ├── repositories/
│   │   ├── FighterRepository.java
│   │   ├── UserAppRepository.java
│   │   ├── FavFighterRepository.java
│   │   └── FavFightRepository.java
│   ├── security/
│   │   ├── SecurityConfig.java
│   │   └── UserAppInfo.java
│   └── services/
│       ├── FighterService.java
│       ├── UserAppService.java
│       ├── FavFighterService.java
│       ├── FavFightService.java
│       └── OllamaClientService.java
│
├── src/main/resources/
│   ├── application.properties           # Configuración principal (PostgreSQL + Ollama)
│   ├── static/
│   │   ├── css/index.css
│   │   ├── fonts/sonic-extra-bold-bt.ttf
│   │   ├── img/              # 14 fondos webp + loader_ai.gif + waiting_fight.gif + 404_boxing.gif
│   │   ├── js/
│   │   │   ├── comun.js                 # JS propio (preloader, menú, frases)
│   │   │   ├── chart.js                 # Chart.js (vendored)
│   │   │   ├── sweetalert2.js           # SweetAlert2 (vendored)
│   │   │   └── tailwind.js              # Tailwind CSS (vendored)
│   │   └── logos/
│   │       ├── ufc_rivals_logo.svg
│   │       ├── ufc_rivals_blanco_logo.svg
│   │       ├── ufc_rivals_negro.svg
│   │       └── window_icon.png
│   └── templates/
│       ├── fragments/
│       │   ├── head.html
│       │   ├── header.html
│       │   ├── footer.html
│       │   └── preloader.html
│       ├── home.html
│       ├── login.html
│       ├── register.html
│       ├── fighters.html
│       ├── simulator.html
│       ├── ranking.html
│       ├── favorites.html
│       ├── user.html
│       ├── privacy.html
│       └── error/
│           ├── 404.html
│           ├── 500.html
│           └── error.html
│
└── src/test/java/com/example/web/
    └── WebApplicationTests.java
```

---

## ⚙️ Guía de instalación

### Prerrequisitos

- **Docker** (última versión)
- **Docker Compose V2** (plugin `docker compose`, no el antiguo `docker-compose` Python)

### Pasos

1. **Clona el repositorio**

```bash
git clone https://github.com/lucaschacon3/TFG-UFC-Rivals.git
cd ufc-rivals
```

2. **Levanta todos los servicios**

```bash
docker compose up -d
```

Esto inicia 4 contenedores en orden:

| Orden | Servicio | Acción |
|:-----:|----------|--------|
| 1 | `db` | PostgreSQL 16 con healthcheck |
| 2 | `ollama` | Servidor Ollama con healthcheck |
| 3 | `ollama-init` | Descarga `llama3.2:3b` vía API y finaliza |
| 4 | `app` | Spring Boot compilado y arrancado |

La primera ejecución descarga el modelo de IA (~2 GB) y construye la imagen de la app, por lo que puede tardar varios minutos.

3. **Verifica que todo está funcionando**

```bash
docker compose ps
```

Todos los servicios deben aparecer como `Up` (excepto `ollama-init`, que aparece como `Exited` con código 0 — es normal, su trabajo es solo descargar el modelo).

4. **Abre el navegador**

```
http://localhost:8080
```

---

## 🔧 Configuración

### Variables de entorno

| Variable | Valor por defecto | Descripción |
|----------|------------------|-------------|
| `SPRING_DATASOURCE_URL` | `jdbc:postgresql://db:5432/ufc_rivals` | URL de conexión a PostgreSQL |
| `SPRING_DATASOURCE_USERNAME` | `postgres` | Usuario de BD |
| `SPRING_DATASOURCE_PASSWORD` | `postgres` | Contraseña de BD |
| `OLLAMA_API_URL` | `http://ollama:11434` | URL del servidor Ollama |
| `OLLAMA_MODEL` | `llama3.2:3b` | Modelo de IA a usar |

Todas tienen valores por defecto funcionales para Docker. No es necesario crear ningún fichero `.env`.

---

## 🖥️ Recorrido por las páginas

### 1. Home (`/`)

| |
|:---:|
| *(captura pendiente)* |

Página de aterrizaje con tres tarjetas enlazando a las secciones principales: **Rankings**, **Fighters** y **Simulator**. El fondo cambia aleatoriamente entre 14 imágenes de UFC. Incluye el header con navegación y el footer con frases aleatorias sobre lucha.

**Controller:** `MainController.java` — método `home()`.

---

### 2. Login (`/login`) y Register (`/register`)

| Login | Register |
|:---:|:---:|
| *(captura pendiente)* | *(captura pendiente)* |

Formularios de inicio de sesión y registro.

- **Login**: muestra mensaje de error si `?error=true` está presente en la URL.
- **Register**: validación en servidor de username (único), email (solo dominios permitidos: `@gmail.com`, `@hotmail.com`, `@outlook.com`, `@yahoo.com`) y contraseña (10-20 caracteres, mayúscula, minúscula, dígito y carácter especial).

**Controller:** `UserController.java` — métodos `loginPage()`, `registerPage()`, `register()`.

---

### 3. Fighters (`/fighters`)

| |
|:---:|
| *(captura pendiente)* |

Listado paginado de todos los luchadores con:

- **Grid de tarjetas** con efecto flip: la cara frontal muestra nombre, apodo, categoría y nacionalidad; al girar, muestra estadísticas completas.
- **Buscador** por nombre o apodo.
- **Ordenación** por peso, victorias totales, victorias por KO o victorias por sumisión (ascendente/descendente).
- **Botón de favorito** (corazón) en cada tarjeta para usuarios autenticados.

**Controller:** `FighterController.java` — método `listFighters()`.

---

### 4. Simulator (`/simulator`)

| |
|:---:|
| *(captura pendiente)* |

La página principal de la aplicación. Permite:

1. **Seleccionar categoría** (weight class) — carga los luchadores de esa categoría.
2. **Elegir dos luchadores** (Fighter 1 y Fighter 2).
3. **Ver tabla comparativa** con todas las estadísticas lado a lado.
4. **Gráfico radar** (Chart.js) comparando: total wins, wins by KO, wins by submission, wins by decision, y total losses.
5. **Simulación por IA**: pulsa "Simulate Fight" para que Ollama genere una predicción narrativa ronda por ronda con un ganador al final.
6. **Guardar la pelea** en favoritos (requiere autenticación).

**Controllers:**
- `SimulatorController.java` — `showSimulator()` renderiza la página.
- `OpenAIController.java` — `POST /api/ai/chat` devuelve la simulación.

---

### 5. Ranking (`/ranking`)

| |
|:---:|
| *(captura pendiente)* |

Ranking top 15 de luchadores en diseño acordeón. Cada posición se puede expandir para ver los detalles completos. Incluye medallas para los 3 primeros puestos (🥇🥈🥉).

**Controller:** `RankingController.java` — método `ranking()`.

---

### 6. Favorites (`/favorites`)

| |
|:---:|
| *(captura pendiente)* |

Panel personal del usuario autenticado que muestra:

- **Fighter Favorites**: luchadores marcados como favoritos, con opción de eliminarlos.
- **Fight Favorites**: peleas simuladas guardadas, con fecha, luchadores y porcentajes de victoria.

**Controller:** `FavoriteController.java` — métodos `favorites()`, `deleteFavoriteFightFavorites()`, `deleteFavoriteFighterFavorites()`.

---

### 7. User (`/user`)

| |
|:---:|
| *(captura pendiente)* |

Página de configuración de cuenta. Requiere contraseña actual para cualquier cambio:

- **Cambiar username**
- **Cambiar email**
- **Cambiar contraseña**
- **Eliminar cuenta** (con confirmación SweetAlert2)

**Controller:** `UserController.java` — métodos `user()`, `updateAccount()`, `deleteAccount()`.

---

### 8. Páginas de error

| 404 Not Found | 500 Internal Error |
|:---:|:---:|
| *(captura pendiente)* | *(captura pendiente)* |

Páginas personalizadas para errores HTTP. La 404 incluye un GIF de boxeo animado.

**Controller:** `ErrorController.java` — método `handleError()`.

---

### 9. Privacy (`/privacy`)

Página estática con la política de privacidad de la aplicación.

---

## 🌐 API REST

### `POST /api/ai/chat`

Endpoint para obtener una simulación narrativa de pelea desde el modelo de Ollama.

**Request:**

```json
{
  "prompt": "Generate a round-by-round simulation of the fight between Islam Makhachev and Ilia Topuria..."
}
```

**Response (200 OK):**

```text
Round 1: Both fighters start cautiously...
Round 2: Makhachev lands a takedown...
...
Winner: Islam Makhachev by unanimous decision
```

**Response (500):**

```text
Error while processing chat request: <detalle> reload the page please
```

**Controller:** `OpenAIController.java` — método `chat()`.
**Service:** `OllamaClientService.java` — método `getChatCompletion()`.

El servicio construye un prompt de sistema y llama a la API `/api/chat` de Ollama con el modelo configurado.

---

## 🗄️ Base de datos

### Esquema (4 tablas)

```
┌───────────────────┐     ┌──────────────────────┐
│     user_app      │     │     fav_fighter      │
├───────────────────┤     ├──────────────────────┤
│ id_user_app (PK)  │◄────┤ id_user_app (PK,FK)  │
│ username (UNIQUE) │     │ id_fighter (PK,FK)   │
│ email (UNIQUE)    │     └──────────┬───────────┘
│ password          │                │
└───────────────────┘                │
       │                             │
       │  ┌──────────────────────┐   │
       │  │      fav_fight       │   │
       │  ├──────────────────────┤   │
       └──┤ id_user_app (FK)    │   │
          │ id_fighter1 (FK)    ├───┘
          │ id_fighter2 (FK)    │
          │ percentage_f1       │
          │ percentage_f2       │
          │ date_fight          │
          └──────────────────────┘

┌─────────────────────────────────────────┐
│               fighter                   │
├─────────────────────────────────────────┤
│ id_fighter (PK)   │  total_losses       │
│ name              │  losses_ko          │
│ surname           │  losses_sub         │
│ nickname          │  losses_dec         │
│ nationality       │  total_draws        │
│ age               │  ranking            │
│ weight            │  image              │
│ height            │                     │
│ reach             │                     │
│ category          │                     │
│ total_fights      │                     │
│ total_wins        │                     │
│ wins_ko           │                     │
│ wins_sub          │                     │
│ wins_dec          │                     │
└─────────────────────────────────────────┘
```

### Relaciones

- **`user_app` 1:N `fav_fighter`** — un usuario puede tener varios luchadores favoritos.
- **`fighter` 1:N `fav_fighter`** — un luchador puede ser favorito de varios usuarios.
- **`user_app` 1:N `fav_fight`** — un usuario puede guardar varias peleas simuladas.
- **`fighter` 1:N `fav_fight`** (como `id_fighter1` o `id_fighter2`).

Todas las claves foráneas usan `ON DELETE CASCADE`.

### Datos iniciales

- **2 usuarios** de prueba: `admin` y `lucas` (contraseñas cifradas con BCrypt).
- **80+ luchadores** de UFC con estadísticas reales y enlaces a imágenes oficiales de UFC.com.

### Stack de acceso a datos

El proyecto usa **Spring Data JDBC** con `JdbcClient` (consultas SQL manuales mapeadas a DTOs), no JPA. No hay anotaciones `@Entity`, `@Table` ni `@Column`. Cada repositorio es una clase `@Repository` que inyecta `JdbcClient` para ejecutar SQL directamente.

---

## 🔒 Seguridad

- **Form login clásico** con Spring Security.
- **Contraseñas cifradas** con `BCryptPasswordEncoder`.
- **Rutas públicas** (sin autenticación): `/`, `/login`, `/register`, `/privacy`, `/ranking`, `/api/ai/**`, recursos estáticos (`/css/**`, `/js/**`, `/img/**`, `/fonts/**`).
- **Rutas privadas**: `/user`, `/favorites`, `/fighters/favorite` (POST/DELETE), `/simulator/save`.
- **CSRF deshabilitado** globalmente (necesario para las llamadas `@ResponseBody` desde el frontend).
- **Sesión gestionada mediante cookies de servidor** — no hay OAuth2, JWT ni tokens.

---

## 🐳 Arquitectura Docker

```
┌─────────────────────────────────────────────────────────┐
│                    docker-compose.yml                     │
│                                                          │
│  ┌──────────────┐    ┌──────────────┐                    │
│  │     db       │    │   ollama     │                    │
│  │ PostgreSQL 16│    │ ollama/ol.   │                    │
│  │ port: (int.) │    │ port: (int.) │                    │
│  │ healthcheck ◄────► healthcheck  │                    │
│  └──────┬───────┘    └──────┬───────┘                    │
│         │                   │                            │
│         │    ┌──────────────────┐                        │
│         │    │  ollama-init     │                        │
│         │    │ curlimages/curl  │                        │
│         │    │ curl POST /pull  │                        │
│         │    │ llama3.2:3b     │                        │
│         │    └────────┬─────────┘                        │
│         │             │ (exited when done)               │
│         │             │                                  │
│         │    ┌──────────────────┐                        │
│         └────┤      app        │                        │
│              │  Spring Boot    │                        │
│              │  port: 8080     │◄── host: localhost:8080 │
│              │  OLLAMA_API_URL │                        │
│              │  =http://ollama │                        │
│              │  :11434         │                        │
│              └──────────────────┘                        │
│                                                          │
│  Volúmenes:  pg_data  │  ollama_data                     │
└─────────────────────────────────────────────────────────┘
```

### Servicios

| Servicio | Imagen | Depende de | Healthcheck |
|----------|--------|------------|-------------|
| `db` | `postgres:16-alpine` | — | `pg_isready` |
| `ollama` | `ollama/ollama` | — | `ollama list` |
| `ollama-init` | `curlimages/curl` | `ollama` (healthy) | — |
| `app` | (build local) | `db` + `ollama` + `ollama-init` | — |

### Flujo de arranque

1. Se inician `db` y `ollama` en paralelo.
2. Cuando `ollama` responde, se ejecuta `ollama-init` para descargar `llama3.2:3b`.
3. Una vez que PostgreSQL acepta conexiones y `ollama-init` finaliza con éxito, se inicia la app.
4. Spring Boot se conecta a PostgreSQL y a Ollama por nombre de servicio DNS interno de Docker.

---
El modelo de IA se descarga automáticamente en `ollama-init`. Para cambiarlo, edita la variable `OLLAMA_MODEL` en `docker-compose.yml` y, opcionalmente, el comando curl en `ollama-init`.

### Añadir más luchadores

Edita `db/init.sql` y añade nuevas filas al `INSERT INTO fighter (...) ... ON CONFLICT (id_fighter) DO NOTHING`. Los datos se cargan la primera vez que se inicia PostgreSQL con un volumen vacío. Si ya existen, elimina el volumen con `docker compose down -v`.

---

## 📄 Licencia

Este proyecto está bajo la licencia MIT.
