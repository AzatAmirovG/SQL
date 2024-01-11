WITH VOLUME_CTE (user_id, type, currency_id, volume)
AS (SELECT user_id,
            balance.type,
            currency_id,
            SUM(money)
FROM balance
GROUP BY user_id, balance.type, currency_id),

LAST_RATE_CTE (currency_id, rate_to_usd, updated)
AS (SELECT  id,
            rate_to_usd,
            updated
    FROM currency
    ORDER BY updated DESC),

TABLE_CTE (name, lastname, type, volume, currency_name, last_rate_to_usd)
AS (SELECT DISTINCT COALESCE(public.user.name, 'not defined'),
            COALESCE (public.user.lastname, 'not defined'),
            VOLUME_CTE.type,
            VOLUME_CTE.volume,
            COALESCE(currency.name, 'not defined'),
            COALESCE ((SELECT LAST_RATE_CTE.rate_to_usd
            FROM LAST_RATE_CTE
            WHERE LAST_RATE_CTE.currency_id = VOLUME_CTE.currency_id
            LIMIT 1), 1)
FROM VOLUME_CTE
JOIN public.user ON public.user.id = VOLUME_CTE.user_id
FULL JOIN currency ON currency.id = VOLUME_CTE.currency_id),

FINAL_CTE (name, lastname, type, volume, currency_name, last_rate_to_usd, total_volume_in_usd)
AS (SELECT TABLE_CTE.*,
            volume * last_rate_to_usd
    FROM TABLE_CTE
    ORDER BY 1 DESC, 2, 3)

SELECT *
FROM FINAL_CTE