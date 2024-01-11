-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH CURRENCY_CTE (id, name)
AS (SELECT DISTINCT id,
            name
FROM currency)

SELECT   COALESCE(public.user.name, 'not defined') AS name,
            COALESCE (public.user.lastname, 'not defined') AS lastname,
            COALESCE(CURRENCY_CTE.name, 'not defined') AS currency_name,
            (SELECT currency.rate_to_usd
            FROM currency
            WHERE currency.id = balance.currency_id
            AND currency.updated = COALESCE((SELECT currency.updated
                    FROM currency
                    WHERE currency.id = balance.currency_id
                    AND balance.updated > currency.updated
                    ORDER BY 1 DESC
                    LIMIT 1), (SELECT currency.updated
                            FROM currency
                            WHERE currency.id = balance.currency_id
                            AND balance.updated < currency.updated
                            ORDER BY 1
                            LIMIT 1))) * balance.money AS currency_in_id
FROM balance
LEFT JOIN public.user ON public.user.id = balance.user_id
LEFT JOIN CURRENCY_CTE ON CURRENCY_CTE.id = balance.currency_id
WHERE CURRENCY_CTE.id IS NOT NULL
ORDER BY 1 DESC, 2, 3
