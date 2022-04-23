/* DROP SCHEMA IF EXISTS cpb CASCADE;
CREATE SCHEMA cpb;

SET search_path = cpb;
SET default_tablespace = project; */

DROP TABLE IF EXISTS cpb_crypto_curs;
DROP TABLE IF EXISTS cpb_prices;
DROP TABLE IF EXISTS cpb_exchanges;
DROP TABLE IF EXISTS cpb_markets;

CREATE TABLE cpb_crypto_curs(
	cpb_cc_id VARCHAR(63) PRIMARY KEY,
	cpb_cc_name VARCHAR(255) NOT NULL,
	cpb_cc_symbol VARCHAR(5) NOT NULL,
	cpb_cc_supply DECIMAL NOT NULL CHECK(cpb_cc_supply>0), 
	cpb_cc_max_supply DECIMAL CHECK(cpb_cc_max_supply>0 AND cpb_cc_max_supply>=cpb_cc_supply)
);

CREATE TABLE cpb_prices(
	cpb_pr_id SERIAL PRIMARY KEY,
	cpb_pr_cc_id VARCHAR(63) NOT NULL,
	cpb_pr_rate_usd DECIMAL NOT NULL CHECK(cpb_pr_rate_usd>0),
	cpb_pr_type VARCHAR(10) NOT NULL
);

CREATE TABLE cpb_exchanges(
	cpb_ex_id VARCHAR(63) PRIMARY KEY,
	cpb_ex_name VARCHAR(40) NOT NULL,
	cpb_ex_rank INT NOT NULL CHECK(cpb_ex_rank>0),
	cpb_ex_percent_total_vol DECIMAL NOT NULL CHECK(cpb_ex_percent_total_vol>0 AND cpb_ex_percent_total_vol<100),
	cpb_ex_volume_usd BIGINT NOT NULL CHECK(cpb_ex_volume_usd>0),
	cpb_ex_trading_pairs INT NOT NULL CHECK(cpb_ex_trading_pairs>0),
	cpb_ex_URL VARCHAR(255) NOT NULL,
	cpb_ex_updated BIGINT NOT NULL CHECK(cpb_ex_updated>0)
);

CREATE TABLE cpb_markets(
	cpb_mk_id SERIAL PRIMARY KEY,
	cpb_mk_exchange_id VARCHAR(63) NOT NULL,
	cpb_mk_base_id VARCHAR(63) NOT NULL,
	cpb_mk_quote_id VARCHAR(63) NOT NULL,
	cpb_mk_price_quote DECIMAL NOT NULL CHECK(cpb_mk_price_quote>0),
	cpb_mk_price_usd DECIMAL NOT NULL CHECK(cpb_mk_price_usd>0),
	cpb_mk_volume_usd_24_h DECIMAL NOT NULL CHECK(cpb_mk_volume_usd_24_h>0),
	cpb_mk_percent_exchange_vol DECIMAL NOT NULL CHECK(cpb_mk_percent_exchange_vol>0 AND cpb_mk_percent_exchange_vol<100),
	cpb_mk_trades_24_h BIGINT NOT NULL CHECK(cpb_mk_trades_24_h>0),
	cpb_mk_updated BIGINT NOT NULL CHECK(cpb_mk_updated>0)
);