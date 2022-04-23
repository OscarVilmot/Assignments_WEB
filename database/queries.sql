/* SET search_path = cpb;
SET default_tablespace = project; */

SELECT * FROM cpb_prices;

SELECT cpb_cc_name AS crypto_name, cpb_pr_rate_usd AS usd_rate 
FROM cpb_crypto_curs
JOIN cpb_prices ON cpb_cc_id = cpb_pr_cc_id;

SELECT cpb_ex_name AS exchange_name, cpb_mk_base_id AS base_id, cpb_mk_quote_id AS quote_id, cpb_mk_price_quote AS base_price_on_quote
FROM cpb_markets
JOIN cpb_exchanges ON cpb_mk_exchange_id = cpb_ex_id
WHERE cpb_ex_id = 'binance';

SELECT cpb_ex_name AS exchange_name, cpb_cc_name AS crypto_name, cpb_cc_symbol AS crypto_symbol, cpb_mk_quote_id AS quote_id, cpb_mk_price_usd AS price_usd
FROM cpb_crypto_curs
JOIN cpb_markets ON cpb_mk_base_id = cpb_cc_id
JOIN cpb_exchanges ON cpb_ex_id = cpb_mk_exchange_id;

