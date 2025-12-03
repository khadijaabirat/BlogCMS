
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