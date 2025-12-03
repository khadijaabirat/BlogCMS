
INSERT INTO users (username, email, role, password_hash) VALUES
('jdupont', 'jean.dupont@email.com', 'editor', '$2y$10$')


SELECT title, created_at_po, status_Post FROM post



UPDATE post 
set status_Post='archivé'
WHERE status_Post='draft' AND created_at_po<'2024-01-01'




DELETE FROM comments
WHERE status_com='spam' and datediff(CURRENT_DATE,created_at_com)>365;


SELECT * FROM post
WHERE post.created_at_po <'01-10-2024';


SELECT * FROM users
ORDER BY created_at DESC;


SELECT title, created_at_po, updated_at_po FROM post
ORDER BY created_at_po DESC LIMIT 5



SELECT DISTINCT role
FROM users;



SELECT * FROM post
WHERE category_id=1 AND (status_Post='published' OR  status_Post='draft');



SELECT * FROM comments
WHERE created_at_com BETWEEN '2024-12-01' AND '2024-12-15';




SELECT *FROM post
WHERE post.category_id IN ( SELECT categories.category_id 
                           FROM categories WHERE categories.name IN('PHP','JavaScript', 'Base de données')
);


SELECT * FROM users
WHERE email LIKE'%@gmail.com';


SELECT COUNT(*)FROM post
WHERE status_Post='published';


SELECT category_id ,COUNT(id_posts) FROM post
GROUP BY category_id; 



SELECT AVG(CHAR_length(content)) FROM post
WHERE status_Post='published';


SELECT max(created_at_po) FROM post
WHERE status_Post='published';



SELECT MIN(created_at_com) FROM comments;


SELECT SUM(view_count) as totalvues FROM post;



SELECT p.title AS titre_article,
       u.username AS nom_auteur,
       p.created_at AS date_publication
FROM post p
INNER JOIN users u ON p.user_id = u.user_id;



SELECT c.name AS categorie,
       COUNT(p.id_posts) AS nb_articles
FROM categories c
LEFT JOIN post p ON c.category_id = p.category_id
GROUP BY c.category_id, c.name;



SELECT u.username AS nom_utilisateur,
       COUNT(DISTINCT p.id_posts) AS nb_articles,
       COUNT(c.comment_id) AS nb_commentaires
FROM users u
LEFT JOIN post p ON u.user_id = p.user_id
LEFT JOIN comments c ON p.id_posts = c.id_posts
GROUP BY u.user_id, u.username;



SELECT p.id_posts,
       p.title,
       p.user_id,
       p.category_id
FROM post p
LEFT JOIN categories c ON p.category_id = c.category_id
WHERE c.category_id IS NULL;


CREATE VIEW dashboard_articles AS
SELECT 
    p.id_posts,
    p.title AS titre_article,
    u.username AS nom_auteur,
    c.name AS categorie,
    COUNT(cm.comment_id) AS nb_commentaires,
    p.updated_at AS date_derniere_modification
FROM post p
INNER JOIN users u ON p.user_id = u.user_id
INNER JOIN categories c ON p.category_id = c.category_id
LEFT JOIN comments cm ON p.id_posts = cm.id_posts
WHERE p.status_Post = 'published'
GROUP BY p.id_posts, p.title, u.username, c.name, p.updated_at;


SELECT c.name AS categorie,
       COUNT(p.id_posts) AS nb_articles
FROM categories c
LEFT JOIN post p ON c.category_id = p.category_id
GROUP BY c.category_id, c.name
HAVING COUNT(p.id_posts) > 5;


SELECT *
FROM users
WHERE user_id NOT IN (
    SELECT DISTINCT user_id
    FROM post
);


UPDATE post p
INNER JOIN categories c ON p.category_id = c.category_id
SET p.status_Post = 'archivé'
WHERE c.name = 'Obsolète';


