SELECT A.name AS person_name1,
        B.name AS person_name2,
        A.address AS common_address
FROM person A
JOIN person B ON A.address = B.address
AND A.name > B.name
ORDER BY person_name1, person_name2, common_address
