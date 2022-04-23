/* SET search_path = cpb;
SET default_tablespace = project; */

INSERT INTO cpb_crypto_curs(cpb_cc_id, cpb_cc_name, cpb_cc_symbol, cpb_cc_supply, cpb_cc_max_supply)
VALUES	('bitcoin', 'Bitcoin', 'BTC', 19014856, 21000000),
		('ethereum', 'Ethereum', 'ETH', 120423837.374, NULL),
		('tether', 'Tether', 'USDT', 82728361431.52509, NULL),
		('binance-coin', 'BNB', 'BNB', 166801148, 166801148);
	
INSERT INTO cpb_prices(cpb_pr_cc_id, cpb_pr_rate_usd, cpb_pr_type)
VALUES	('bitcoin' , 6441.6817435327728704, 'crypto'),
		('ethereum' , 216.8851874308141457, 'crypto'),
		('tether', 1.0003322560439686, 'crypto'),
		('binance-coin', 9.9474321239195151, 'crypto');
		
INSERT INTO cpb_exchanges(cpb_ex_id, cpb_ex_name, cpb_ex_rank, cpb_ex_percent_total_vol, cpb_ex_volume_usd, cpb_ex_trading_pairs, cpb_ex_url, cpb_ex_updated)
VALUES	('currency-com', 'Currency.com', 1, 35.244902234069132438000000000000000000, 19167396920.8066954512241574, 71, 'https://currency.com/', 1650664884856),
		('binance', 'Binance', 2, 20.446499069883209940000000000000000000, 11119513418.1568029845832372, 928, 'https://www.binance.com/', 1650665135078),
		('hitbtc', 'HitBTC', 3, 6.060649924385913323000000000000000000, 3295991060.7006970408959530, 931, 'https://hitbtc.com/', 1650665094676),
		('crypto', 'Crypto.com', 4, 3.980991118235712061000000000000000000, 2165000668.5979765923603855, 195, 'https://api.crypto.com/', 1650665141075);
		
INSERT INTO cpb_markets(cpb_mk_exchange_id, cpb_mk_base_id, cpb_mk_quote_id, cpb_mk_price_quote, cpb_mk_price_usd, cpb_mk_volume_usd_24_h, cpb_mk_percent_exchange_vol, cpb_mk_trades_24_h, cpb_mk_updated)
VALUES	('binance', 'bitcoin', 'tether', 39618.5900000000000000, 39681.9020526666784643, 1690544406.8633742922069404, 17.6918121323112553, 1646263, 1650695090781),
		('crypto', 'bitcoin', 'tether', 39601.2000000000000000, 39669.9596853901019094, 1069005478.3869423603876435, 56.6084873116231914, 15600, 1650696113865),
		('binance', 'ethereum', 'tether', 2953.7900000000000000, 2958.9206242127512966, 1239122113.7095262023170771, 13.1310792407195928, 1650931, 1650696234059),
		('crypto', 'ethereum', 'tether', 2953.1800000000000000, 2958.5836235809308042, 573881712.4844637326352580, 30.4582344074958010, 15600, 1650696343736);
