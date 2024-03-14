INSERT INTO public."user"(lastname, firstname, email)
VALUES (
        'Lamoureux',
        'Agrican',
        'AgricanLamoureux@dayrep.com'
    ),
    ('Leroux', 'André', 'AndreLeroux@cuvox.de'),
    ('Quinn', 'Vallis', 'VallisQuinn@cuvox.de'),
    (
        'Rivard',
        'Paulette',
        'PauletteRivard@teleworm.us'
    ),
    ('Chabot', 'Marie', 'MarieChabot@superrito.com'),
    (
        'Thériault',
        'Logistilla',
        'LogistillaTheriault@fleckens.hu'
    ),
    (
        'Labonté',
        'Melisande',
        'MelisandeLabonte@fleckens.hu'
    ),
    (
        'Bordeaux',
        'Auguste',
        'AugusteBordeaux@fleckens.hu'
    ),
    (
        'Laliberté',
        'Azura',
        'AzuraLaliberte@einrot.com'
    ),
    (
        'Larivière',
        'Rosamonde',
        'RosamondeLariviere@armyspy.com'
    ),
    ('Lacroix', 'Loyal', 'LoyalLacroix@dayrep.com'),
    ('Maheu', 'Francis', 'FrancisMaheu@dayrep.com'),
    ('Méthot', 'Perrin', 'PerrinMethot@dayrep.com'),
    ('Franchet', 'Alita', 'AlitaFranchet@fleckens.hu'),
    (
        'Desroches',
        'Ormazd',
        'OrmazdDesroches@jourrapide.com'
    ),
    (
        'Brousseau',
        'Cendrillon',
        'CendrillonBrousseau@rhyta.com'
    ),
    ('Blanc', 'Aloin', 'AloinBlanc@armyspy.com'),
    ('Beaulé', 'Aya', 'AyaBeaule@rhyta.com'),
    ('Petit', 'Falerina', 'FalerinaPetit@gustr.com'),
    (
        'Rancourt',
        'Thomas',
        'ThomasRancourt@superrito.com'
    ),
    (
        'Lamontagne',
        'Daniel',
        'DanielLamontagne@teleworm.us'
    ),
    (
        'Tollmache',
        'Patrice',
        'PatriceTollmache@dayrep.com'
    ),
    ('Plante', 'Dexter', 'DexterPlante@teleworm.us'),
    (
        'Berthiaume',
        'Holly',
        'HollyBerthiaume@superrito.com'
    ),
    ('Paulet', 'Vachel', 'VachelPaulet@dayrep.com'),
    ('Paulet', 'Aloin', 'AloinPaulet@cuvox.de'),
    (
        'Blais',
        'Frédérique',
        'FrederiqueBlais@teleworm.us'
    ),
    (
        'Legault',
        'Auguste',
        'AugusteLegault@jourrapide.com'
    ),
    (
        'LeBatelier',
        'Genevre',
        'GenevreLeBatelier@teleworm.us'
    ),
    (
        'Gougeon',
        'Ansel',
        'AnselGougeon@jourrapide.com'
    ),
    ('Quiron', 'Josephe', 'JosepheQuiron@fleckens.hu'),
    ('Goulet', 'Gill', 'GillGoulet@cuvox.de'),
    ('Fluet', 'Dixie', 'DixieFluet@armyspy.com'),
    (
        'Labossière',
        'Aubert',
        'AubertLabossiere@superrito.com'
    ),
    (
        'Alexandre',
        'Pinabel',
        'PinabelAlexandre@jourrapide.com'
    ),
    ('Huppé', 'Adélaïde', 'AdelaideHuppe@cuvox.de'),
    (
        'St-Jean',
        'Bradamate',
        'BradamateSt-Jean@teleworm.us'
    ),
    (
        'Croteau',
        'Courtland',
        'CourtlandCroteau@cuvox.de'
    ),
    ('Abril', 'Fanchon', 'FanchonAbril@fleckens.hu'),
    ('Arcouet', 'Hélène', 'HeleneArcouet@dayrep.com'),
    ('Langlois', 'Eliot', 'EliotLanglois@teleworm.us'),
    ('Boucher', 'Orlene', 'OrleneBoucher@armyspy.com'),
    ('Benoit', 'Turner', 'TurnerBenoit@fleckens.hu'),
    (
        'Harquin',
        'Charline',
        'CharlineHarquin@teleworm.us'
    ),
    ('Morin', 'Tanguy', 'TanguyMorin@superrito.com'),
    ('Girard', 'Legget', 'LeggetGirard@armyspy.com'),
    ('Plante', 'Brigitte', 'BrigittePlante@gustr.com'),
    (
        'Garreau',
        'Satordi',
        'SatordiGarreau@fleckens.hu'
    ),
    (
        'Guernon',
        'Maureen',
        'MaureenGuernon@jourrapide.com'
    ),
    (
        'Chevrette',
        'Fletcher',
        'FletcherChevrette@rhyta.com'
    );

INSERT INTO "group" 
(name, description, private, creator_id)
VALUES
('photography','Group for all photography lovers', true,  11),
('music', 'Group for music lovers', true, 2),
('art', 'Group for artists lovers', false, 5),
('travel', 'Group for travelers', false, 6);

INSERT INTO post (title, description, date, img_url, user_id, group_id)
VALUES (
        'Glowing, antiduke_99 (me), soft pastel, 2024',
        'For a couple of weeks we''ve been getting messages from users not being able to post on this sub: the Post button remains greyed out. The commonality of the reports seem to be that they have been trying to use the Android reddit app to post. So if this problem has been bugging you, please report it to Reddit in the android app store. Until it''s fixed you can post your art in the web browser on a computer.\n\nAnd yes, we know the app seemingly allows posting on other subs, and not on /r/Art. But the iPhone app works fine (tested myself). It probably has to do with the title requirements that this sub has, it uses a thing called regex, and I suspect this title requirement is causing the android app to not function correctly.',
        '2023-10-11T19:49:17.508Z',
        'https://preview.redd.it/i-spy-antiduke-99-me-soft-pastel-2023-v0-uawfikcejzbb1.jpg?width=1080&crop=smart&auto=webp&s=0c6755e2e96e5b0d978d07f0fc98e39f139562f7',
        2, null
    ),
    (
        'Into the Mind of a Preda…nko, Oil Painting, 2024',
        'For a couple of weeks .',
        '2023-10-11T19:49:17.407Z',
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjiyySNtpYS7nPhuB6N7Ocv_faq5mfBRlpleLpe29lit89k4ebkqbD9SxqwCK0gdhUF7B2ajz5LuYiKo7ZFWCblQo6YYUxgax3o_samVXG_PbIfLbyIVFj9BUw5SvZbSPUf1wNKULbUHDw/s1600/8365988881_1835dc9ce2_k.jpg',
        5, null
    ),
    (
        'Ladybird, Throwawayaway576, Mixed Media, 2023',
        'Ladybird, Throwawayaway576, Mixed Media, 2023',
        '2023-10-11T20:05:57.407Z',
        'https://preview.redd.it/ladybird-throwawayaway576-mixed-media-2023-v0-zh9s60cuttnc1.jpeg?width=1080&crop=smart&auto=webp&s=f2d12f8889fd5432f643ad2aaf9723324d1346fc',
        11, 1
    ),
    (
        '"What Books did You Start…s Week?: March 04, 2024',
        'We want to know!We are displaying the books found in this thread in the book strip at the top of the page. If you want the books you''re reading included, use the formatting below.\n\n**Formatting your book info Post your book info in this format:**the title, by the author** \n\nFor example:\n\n**The Bogus Title, by Stephen King**\n\n* This formatting is voluntary but will help us include your selections in the book strip banner.\n\n* Entering your book data in this format will make it easy to collect the data, and the bold text will make the books titles stand out and might be a little easier to read.\n\n* Enter as many books per post as you like but only the parent comments will be included.',
        '2024-03-11T20:05:57.407Z',
        'https://i.pinimg.com/originals/1c/c4/bb/1cc4bba1c944c8d7968e3c314394cc31.jpg',
        21, null
    );


INSERT INTO comment (
        description,
        post_id,
        user_id,
        parent
    )
VALUES 
    ('Superbe œuvre d''art !', 1, 10, 0),
    ('J’adore cette pièce !', 3, 11, 1),
    ('Les couleurs sont magnifiques !', 3, 10, 0);

INSERT INTO reaction (type)
VALUES 
    ('Like'),
    ('Anger'),
    ('Laugh'),
    ('Choc'),
    ('Dislike');

INSERT INTO post_user_react(post_id, user_id, reaction_id)
VALUES 
    (1, 5, 1),
    (1, 22, 1),
    (3, 11, 4);

INSERT INTO follow(follower, followed,toBeNotified)
VALUES 
    (1, 11,true),
    (5, 12,false),
    (11, 3,true);

INSERT INTO group_member
(group_id , user_id, role)
VALUES
(1, 8, 'admin'),
(1, 9,'moderator'),
(1, 7,'editor'),
(1, 3, 'visitor'),
(2, 3, 'admin'),
(2, 6, 'moderator'),
(2, 9, 'editor'),
(2, 8, 'visitor'),
(3, 1, 'admin'), 
(3, 10, 'moderator'),
(3, 21, 'editor'),
(3, 7, 'visitor'),
(3, 8,  'visitor'),
(4, 11, 'admin'),
(4,7, 'editor'),
(4, 18, 'visitor');

INSERT INTO session 
    (user_id, start_time, end_time)
    VALUES
    (1, '2024-03-13 14:17:00', CURRENT_TIMESTAMP),
    (2, '2024-03-13 14:07:00', '2024-03-13 14:17:00');
