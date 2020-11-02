#Challenge 1
CREATE TEMPORARY TABLE Profit_sale
SELECT titles.title_id as 'Title ID', authors.au_id as 'AUTHOR ID', (titles.price*sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100)) AS 'Royalty for each sale'
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
LEFT JOIN roysched ON titles.title_id = roysched.title_id
GROUP BY 'Title ID', 'AUTHOR ID', 'Royalty for each sale'
ORDER BY 'Title ID';

 CREATE TEMPORARY TABLE Profit_title
 SELECT Profit_sale.title_id, Profit_sale.au_id, SUM(PROFIT_SALE.Profit) AS 'Title_Profit'
 FROM Profit_sale
 GROUP BY Profit_sale.title_id, Profit_sale.au_id;

