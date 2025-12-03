1/
INSERT INTO users (username, email, role, password_hash) VALUES
('jdupont', 'jean.dupont@email.com', 'editor', '$2y$10$')

2/
SELECT title, created_at_po, status_Post FROM post


3/
UPDATE post 
set status_Post='archivé'
WHERE status_Post='draft' AND created_at_po<'2024-01-01'



4/
DELETE FROM comments
WHERE status_com='spam' and datediff(CURRENT_DATE,created_at_com)>365;



5/
SELECT * FROM post
WHERE post.created_at_po <'01-10-2024';


6/
SELECT * FROM users
ORDER BY created_at DESC;



7/
SELECT title, created_at_po, updated_at_po FROM post
ORDER BY created_at_po DESC LIMIT 5



8/
SELECT DISTINCT role
FROM users;


9/
SELECT * FROM post
WHERE category_id=1 AND (status_Post='published' OR  status_Post='draft');


10/
SELECT * FROM comments
WHERE created_at_com BETWEEN '2024-12-01' AND '2024-12-15';



11/
SELECT *FROM post
WHERE post.category_id IN ( SELECT categories.category_id 
                           FROM categories WHERE categories.name IN('PHP','JavaScript', 'Base de données')
);

12/
SELECT * FROM users
WHERE email LIKE'%@gmail.com';

13/
SELECT COUNT(*)FROM post
WHERE status_Post='published';

14/
SELECT category_id ,COUNT(id_posts) FROM post
GROUP BY category_id; 


15/
SELECT AVG(CHAR_length(content)) FROM post
WHERE status_Post='published';

16/
SELECT max(created_at_po) FROM post
WHERE status_Post='published';

SELECT MIN(created_at_com) FROM comments;

17/
SELECT SUM(view_count) as totalvues FROM post;


18/
SELECT p.title AS titre_article,
       u.username AS nom_auteur,
       p.created_at AS date_publication
FROM post p
INNER JOIN users u ON p.user_id = u.user_id;


19/
SELECT c.name AS categorie,
       COUNT(p.id_posts) AS nb_articles
FROM categories c
LEFT JOIN post p ON c.category_id = p.category_id
GROUP BY c.category_id, c.name;


20/
SELECT u.username AS nom_utilisateur,
       COUNT(DISTINCT p.id_posts) AS nb_articles,
       COUNT(c.comment_id) AS nb_commentaires
FROM users u
LEFT JOIN post p ON u.user_id = p.user_id
LEFT JOIN comments c ON p.id_posts = c.id_posts
GROUP BY u.user_id, u.username;


21/
SELECT p.id_posts,
       p.title,
       p.user_id,
       p.category_id
FROM post p
LEFT JOIN categories c ON p.category_id = c.category_id
WHERE c.category_id IS NULL;

22/
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

23/
SELECT c.name AS categorie,
       COUNT(p.id_posts) AS nb_articles
FROM categories c
LEFT JOIN post p ON c.category_id = p.category_id
GROUP BY c.category_id, c.name
HAVING COUNT(p.id_posts) > 5;

24/
SELECT *
FROM users
WHERE user_id NOT IN (
    SELECT DISTINCT user_id
    FROM post
);

25/
UPDATE post p
INNER JOIN categories c ON p.category_id = c.category_id
SET p.status_Post = 'archivé'
WHERE c.name = 'Obsolète';


