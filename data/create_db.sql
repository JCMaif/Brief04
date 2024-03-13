BEGIN;
DROP TABLE IF EXISTS follow CASCADE;
DROP TABLE IF EXISTS post_user_react CASCADE;
DROP TABLE IF EXISTS comment CASCADE;
DROP TABLE IF EXISTS reaction CASCADE;
DROP TABLE IF EXISTS post CASCADE;
DROP TABLE IF EXISTS "user" CASCADE;
DROP TABLE IF EXISTS "group" CASCADE;
DROP TABLE IF EXISTS group_member CASCADE;
DROP TABLE IF EXISTS session CASCADE;

CREATE TABLE IF NOT EXISTS "user"
(
    id serial PRIMARY KEY,
    lastname character varying(50) NOT NULL,
    firstname character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    img_url character varying(100) ,
    first_login BOOLEAN DEFAULT true,
    password  character varying(50) NOT NULL default ''
);

CREATE TABLE IF NOT EXISTS "group" (
    id serial PRIMARY  KEY, 
    name varchar(128) NOT NULL,
    description text,
    private BOOLEAN  NOT NULL DEFAULT false,
    creator_id integer NOT NULL REFERENCES "user" (id) ON DELETE CASCADE -- si le créateur du groupe est supprimé, un message d'alerte devrait le prévenir de nommer un autre super user ou que les groupes dont il est super user seront supprimés 
);

CREATE TABLE IF NOT EXISTS post
(
    id serial PRIMARY KEY,
    title text NOT NULL,
    description text,
    date TIMESTAMP WITH TIME ZONE NOT NULL,
    user_id integer REFERENCES "user" (id) ON DELETE SET NULL,
    group_id INTEGER REFERENCES "group"(id) ON DELETE CASCADE        
);

CREATE TABLE IF NOT EXISTS reaction
(
    id serial PRIMARY KEY,
    type character varying(50)
);

CREATE TABLE IF NOT EXISTS comment
(
   id serial PRIMARY KEY,
    description text,
    post_id integer REFERENCES post (id) ON DELETE CASCADE,
    user_id integer REFERENCES "user" (id) ON DELETE SET NULL,
    parent integer
);

CREATE TABLE IF NOT EXISTS post_user_react
(
    post_id integer NOT NULL REFERENCES post (id) ON DELETE CASCADE,
    user_id integer NOT NULL REFERENCES "user" (id) ON DELETE CASCADE,
    reaction_id integer NOT NULL REFERENCES reaction(id),
    CONSTRAINT post_user_react_pkey PRIMARY KEY (post_id, user_id, reaction_id)
);

CREATE TABLE IF NOT EXISTS follow
(
    follower integer NOT NULL REFERENCES "user" (id) ON DELETE CASCADE,
    followed integer NOT NULL REFERENCES "user" (id) ON DELETE CASCADE,
    toBeNotified boolean NOT NULL DEFAULT true,
    CONSTRAINT follow_pkey PRIMARY KEY (follower, followed)
);

CREATE TABLE IF NOT EXISTS group_member (
    group_id INTEGER NOT NULL REFERENCES "group"(id) ON DELETE CASCADE,
    user_id INTEGER NOT NULL REFERENCES "user"(id) ON DELETE CASCADE,
    role VARCHAR(32) NOT NULL,
    CONSTRAINT group_member_pkey PRIMARY KEY (group_id, user_id)
);

CREATE TABLE IF NOT EXISTS session (
    id serial PRIMARY KEY,
    user_id INTEGER REFERENCES "user" (id) ON DELETE CASCADE,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL
);


COMMIT;
