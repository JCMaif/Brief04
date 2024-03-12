BEGIN;
DROP TABLE IF EXISTS follow CASCADE;
DROP TABLE IF EXISTS post_user_react CASCADE;
DROP TABLE IF EXISTS comment CASCADE;
DROP TABLE IF EXISTS reaction CASCADE;
DROP TABLE IF EXISTS post CASCADE;
DROP TABLE IF EXISTS "user" CASCADE;

CREATE TABLE IF NOT EXISTS "user"
(
    id serial NOT NULL,
    lastname character varying(50) NOT NULL,
    firstname character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    img_url character varying(100) ,
    first_login BOOLEAN DEFAULT true,
    password  character varying(50) NOT NULL default '',
    CONSTRAINT user_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS post
(
    id serial NOT NULL,
    title text NOT NULL,
    description text,
    date TIMESTAMP WITH TIME ZONE NOT NULL,
    user_id integer,
    CONSTRAINT post_pkey PRIMARY KEY (id),
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES "user" (id) MATCH SIMPLE
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS reaction
(
    id serial NOT NULL,
    type character varying(50),
    CONSTRAINT reaction_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS comment
(
    id serial NOT NULL,
    description text,
    post_id integer,
    user_id integer,
    parent integer,
    CONSTRAINT comment_pkey PRIMARY KEY (id),
    CONSTRAINT post_id FOREIGN KEY (post_id)
        REFERENCES post (id) MATCH SIMPLE
        ON DELETE CASCADE,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES "user" (id) MATCH SIMPLE
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS post_user_react
(
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    reaction_id integer NOT NULL,
    CONSTRAINT post_user_react_pkey PRIMARY KEY (post_id, user_id, reaction_id),
    CONSTRAINT post_id FOREIGN KEY (post_id)
        REFERENCES post (id) MATCH SIMPLE
        ON DELETE CASCADE,
    CONSTRAINT reaction_id FOREIGN KEY (reaction_id)
        REFERENCES reaction (id) MATCH SIMPLE
        ON DELETE NO ACTION,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES "user" (id) MATCH SIMPLE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS follow
(
    follower integer NOT NULL,
    followed integer NOT NULL,
    toBeNotified boolean NOT NULL DEFAULT true,
    CONSTRAINT follow_pkey PRIMARY KEY (follower, followed),
    CONSTRAINT followed FOREIGN KEY (followed)
        REFERENCES "user" (id) MATCH SIMPLE
        ON DELETE CASCADE,
    CONSTRAINT follower FOREIGN KEY (follower)
        REFERENCES "user" (id) MATCH SIMPLE
        ON DELETE CASCADE
);


COMMIT;




