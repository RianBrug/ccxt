CREATE TABLE crypto_marketpairs(
   uniswap_info_url                         VARCHAR(72) NOT NULL
  ,dextool_url                              VARCHAR(92)
  ,exchangeid                               INTEGER  NOT NULL
  ,exchangename                             VARCHAR(12) NOT NULL
  ,exchangeslug                             VARCHAR(11) NOT NULL
  ,market_pair_baseexchange_symbol          VARCHAR(4) NOT NULL
  ,market_pair_basecurrency_symbol          VARCHAR(4) NOT NULL
  ,market_pair_basecurrency_id              INTEGER  NOT NULL
  ,market_pair_basecurrency_type            VARCHAR(14) NOT NULL
  ,market_pair_quoteexchange_symbol         VARCHAR(4) NOT NULL
  ,market_pair_quotecurrency_symbol         VARCHAR(4) NOT NULL
  ,market_pair_quotecurrency_id             INTEGER  NOT NULL
  ,market_pair_quotecurrency_type           VARCHAR(14) NOT NULL
  ,quoteexchange_reportedprice              NUMERIC(18,14) NOT NULL
  ,quoteexchange_reportedvolume_24h_base    NUMERIC(16,8) NOT NULL
  ,quoteexchange_reportedvolume_24h_quote   NUMERIC(15,8) NOT NULL
  ,quoteexchange_reportedlast_updated       VARCHAR(24) NOT NULL
  ,quoteUSDprice                            NUMERIC(18,14) NOT NULL
  ,quoteUSDvolume_24h                       NUMERIC(16,8) NOT NULL
  ,quoteUSDlast_updated                     VARCHAR(24) NOT NULL
  ,market_id                                INTEGER  NOT NULL
  ,market_pair                              VARCHAR(9) NOT NULL
  ,category                                 VARCHAR(4) NOT NULL
  ,fee_type                                 VARCHAR(10) NOT NULL
);
INSERT INTO crypto_marketpairs(uniswap_info_url,dextool_url,exchangeid,exchangename,exchangeslug,market_pair_baseexchange_symbol,market_pair_basecurrency_symbol,market_pair_basecurrency_id,market_pair_basecurrency_type,market_pair_quoteexchange_symbol,market_pair_quotecurrency_symbol,market_pair_quotecurrency_id,market_pair_quotecurrency_type,quoteexchange_reportedprice,quoteexchange_reportedvolume_24h_base,quoteexchange_reportedvolume_24h_quote,quoteexchange_reportedlast_updated,quoteUSDprice,quoteUSDvolume_24h,quoteUSDlast_updated,market_id,market_pair,category,fee_type) VALUES ('https://info.uniswap.org/pair/0xfd0a40bc83c5fae4203dec7e5929b446b07d1c76','https://www.dextools.io/app/uniswap/pair-explorer/0xfd0a40bc83c5fae4203dec7e5929b446b07d1c76',1069,'Uniswap (V2)','uniswap-v2','FRAX','FRAX',6952,'cryptocurrency','WETH','WETH',2396,'cryptocurrency',0.0003790433731,2547364.68274584,965.56170186,'2021-05-31T17:00:07.000Z',0.9967944361063,2539198.94249474,'2021-05-31T17:00:07.000Z',69407,'FRAX/WETH','spot','percentage');
INSERT INTO crypto_marketpairs(uniswap_info_url,dextool_url,exchangeid,exchangename,exchangeslug,market_pair_baseexchange_symbol,market_pair_basecurrency_symbol,market_pair_basecurrency_id,market_pair_basecurrency_type,market_pair_quoteexchange_symbol,market_pair_quotecurrency_symbol,market_pair_quotecurrency_id,market_pair_quotecurrency_type,quoteexchange_reportedprice,quoteexchange_reportedvolume_24h_base,quoteexchange_reportedvolume_24h_quote,quoteexchange_reportedlast_updated,quoteUSDprice,quoteUSDvolume_24h,quoteUSDlast_updated,market_id,market_pair,category,fee_type) VALUES ('https://info.uniswap.org/pair/0xe1573b9d29e2183b1af0e743dc2754979a40d237','https://www.dextools.io/app/uniswap/pair-explorer/0xe1573b9d29e2183b1af0e743dc2754979a40d237',1069,'Uniswap (V2)','uniswap-v2','FXS','FXS',6953,'cryptocurrency','FRAX','FRAX',6952,'cryptocurrency',2.6392669584735,511284.20964038,1349415.5208931,'2021-05-31T17:00:07.000Z',2.6353187008704,1347396.83912504,'2021-05-31T17:00:07.000Z',69410,'FXS/FRAX','spot','percentage');
INSERT INTO crypto_marketpairs(uniswap_info_url,dextool_url,exchangeid,exchangename,exchangeslug,market_pair_baseexchange_symbol,market_pair_basecurrency_symbol,market_pair_basecurrency_id,market_pair_basecurrency_type,market_pair_quoteexchange_symbol,market_pair_quotecurrency_symbol,market_pair_quotecurrency_id,market_pair_quotecurrency_type,quoteexchange_reportedprice,quoteexchange_reportedvolume_24h_base,quoteexchange_reportedvolume_24h_quote,quoteexchange_reportedlast_updated,quoteUSDprice,quoteUSDvolume_24h,quoteUSDlast_updated,market_id,market_pair,category,fee_type) VALUES ('https://info.uniswap.org/pair/0x97c4adc5d28a86f9470c70dd91dc6cc2f20d2d4d','https://www.dextools.io/app/uniswap/pair-explorer/0x97c4adc5d28a86f9470c70dd91dc6cc2f20d2d4d',1069,'Uniswap (V2)','uniswap-v2','FRAX','FRAX',6952,'cryptocurrency','USDC','USDC',3408,'cryptocurrency',1.00128399362227,446371.44201129,446944.580096,'2021-05-31T17:00:07.000Z',1.001514036427,447047.26463447,'2021-05-31T17:00:07.000Z',69406,'FRAX/USDC','spot','percentage');
INSERT INTO crypto_marketpairs(uniswap_info_url,dextool_url,exchangeid,exchangename,exchangeslug,market_pair_baseexchange_symbol,market_pair_basecurrency_symbol,market_pair_basecurrency_id,market_pair_basecurrency_type,market_pair_quoteexchange_symbol,market_pair_quotecurrency_symbol,market_pair_quotecurrency_id,market_pair_quotecurrency_type,quoteexchange_reportedprice,quoteexchange_reportedvolume_24h_base,quoteexchange_reportedvolume_24h_quote,quoteexchange_reportedlast_updated,quoteUSDprice,quoteUSDvolume_24h,quoteUSDlast_updated,market_id,market_pair,category,fee_type) VALUES (NULL,NULL,1107,'0x Protocol','0x-protocol','WETH','WETH',2396,'cryptocurrency','FRAX','FRAX',6952,'cryptocurrency',2630.320304853338,82.60218682,217270.20921213,'2021-05-31T17:00:10.000Z',2626.385431153323,216945.18003966,'2021-05-31T17:00:10.000Z',70665,'WETH/FRAX','spot','percentage');
INSERT INTO crypto_marketpairs(uniswap_info_url,dextool_url,exchangeid,exchangename,exchangeslug,market_pair_baseexchange_symbol,market_pair_basecurrency_symbol,market_pair_basecurrency_id,market_pair_basecurrency_type,market_pair_quoteexchange_symbol,market_pair_quotecurrency_symbol,market_pair_quotecurrency_id,market_pair_quotecurrency_type,quoteexchange_reportedprice,quoteexchange_reportedvolume_24h_base,quoteexchange_reportedvolume_24h_quote,quoteexchange_reportedlast_updated,quoteUSDprice,quoteUSDvolume_24h,quoteUSDlast_updated,market_id,market_pair,category,fee_type) VALUES (NULL,NULL,415,'Bilaxy','bilaxy','FRAX','FRAX',6952,'cryptocurrency','USDC','USDC',3408,'cryptocurrency',1.0272,189451.9338,194605.02639936,'2021-05-31T17:00:07.000Z',1.02743599695044,194649.73647799,'2021-05-31T17:00:07.000Z',69409,'FRAX/USDC','spot','percentage');
INSERT INTO crypto_marketpairs(uniswap_info_url,dextool_url,exchangeid,exchangename,exchangeslug,market_pair_baseexchange_symbol,market_pair_basecurrency_symbol,market_pair_basecurrency_id,market_pair_basecurrency_type,market_pair_quoteexchange_symbol,market_pair_quotecurrency_symbol,market_pair_quotecurrency_id,market_pair_quotecurrency_type,quoteexchange_reportedprice,quoteexchange_reportedvolume_24h_base,quoteexchange_reportedvolume_24h_quote,quoteexchange_reportedlast_updated,quoteUSDprice,quoteUSDvolume_24h,quoteUSDlast_updated,market_id,market_pair,category,fee_type) VALUES (NULL,NULL,1107,'0x Protocol','0x-protocol','FRAX','FRAX',6952,'cryptocurrency','USDC','USDC',3408,'cryptocurrency',1.004999999995,78920.6944392,79315.297911,'2021-05-31T17:00:10.000Z',1.00523089654406,79333.520427,'2021-05-31T17:00:10.000Z',70664,'FRAX/USDC','spot','percentage');
INSERT INTO crypto_marketpairs(uniswap_info_url,dextool_url,exchangeid,exchangename,exchangeslug,market_pair_baseexchange_symbol,market_pair_basecurrency_symbol,market_pair_basecurrency_id,market_pair_basecurrency_type,market_pair_quoteexchange_symbol,market_pair_quotecurrency_symbol,market_pair_quotecurrency_id,market_pair_quotecurrency_type,quoteexchange_reportedprice,quoteexchange_reportedvolume_24h_base,quoteexchange_reportedvolume_24h_quote,quoteexchange_reportedlast_updated,quoteUSDprice,quoteUSDvolume_24h,quoteUSDlast_updated,market_id,market_pair,category,fee_type) VALUES (NULL,NULL,1107,'0x Protocol','0x-protocol','FXS','FXS',6953,'cryptocurrency','FRAX','FRAX',6952,'cryptocurrency',2.05701591113326,32691.0951177,67246.10280948,'2021-05-25T19:06:13.000Z',2.0539386821759,67145.50482493,'2021-05-25T19:06:13.000Z',71345,'FXS/FRAX','spot','percentage');
INSERT INTO crypto_marketpairs(uniswap_info_url,dextool_url,exchangeid,exchangename,exchangeslug,market_pair_baseexchange_symbol,market_pair_basecurrency_symbol,market_pair_basecurrency_id,market_pair_basecurrency_type,market_pair_quoteexchange_symbol,market_pair_quotecurrency_symbol,market_pair_quotecurrency_id,market_pair_quotecurrency_type,quoteexchange_reportedprice,quoteexchange_reportedvolume_24h_base,quoteexchange_reportedvolume_24h_quote,quoteexchange_reportedlast_updated,quoteUSDprice,quoteUSDvolume_24h,quoteUSDlast_updated,market_id,market_pair,category,fee_type) VALUES (NULL,NULL,302,'Gate.io','gate-io','FRAX','FRAX',6952,'cryptocurrency','USDT','USDT',825,'cryptocurrency',0.978,29719.30708092,29065.48232514,'2021-05-31T17:01:54.000Z',0.97879186547915,29089.01601848,'2021-05-31T17:01:54.000Z',69408,'FRAX/USDT','spot','percentage');
INSERT INTO crypto_marketpairs(uniswap_info_url,dextool_url,exchangeid,exchangename,exchangeslug,market_pair_baseexchange_symbol,market_pair_basecurrency_symbol,market_pair_basecurrency_id,market_pair_basecurrency_type,market_pair_quoteexchange_symbol,market_pair_quotecurrency_symbol,market_pair_quotecurrency_id,market_pair_quotecurrency_type,quoteexchange_reportedprice,quoteexchange_reportedvolume_24h_base,quoteexchange_reportedvolume_24h_quote,quoteexchange_reportedlast_updated,quoteUSDprice,quoteUSDvolume_24h,quoteUSDlast_updated,market_id,market_pair,category,fee_type) VALUES (NULL,NULL,1107,'0x Protocol','0x-protocol','USDC','USDC',3408,'cryptocurrency','FRAX','FRAX',6952,'cryptocurrency',0.99717578087787,8000,7977.40624702,'2021-05-31T12:10:03.000Z',0.99568403831434,7965.47230651,'2021-05-31T12:10:03.000Z',70663,'USDC/FRAX','spot','percentage');
INSERT INTO crypto_marketpairs(uniswap_info_url,dextool_url,exchangeid,exchangename,exchangeslug,market_pair_baseexchange_symbol,market_pair_basecurrency_symbol,market_pair_basecurrency_id,market_pair_basecurrency_type,market_pair_quoteexchange_symbol,market_pair_quotecurrency_symbol,market_pair_quotecurrency_id,market_pair_quotecurrency_type,quoteexchange_reportedprice,quoteexchange_reportedvolume_24h_base,quoteexchange_reportedvolume_24h_quote,quoteexchange_reportedlast_updated,quoteUSDprice,quoteUSDvolume_24h,quoteUSDlast_updated,market_id,market_pair,category,fee_type) VALUES (NULL,NULL,302,'Gate.io','gate-io','FRAX','FRAX',6952,'cryptocurrency','ETH','ETH',1027,'cryptocurrency',0.0003927,3735.36639063,1.46687838,'2021-05-31T17:01:54.000Z',1.03366962039195,3861.13475903,'2021-05-31T17:01:54.000Z',70662,'FRAX/ETH','spot','percentage');
INSERT INTO crypto_marketpairs(uniswap_info_url,dextool_url,exchangeid,exchangename,exchangeslug,market_pair_baseexchange_symbol,market_pair_basecurrency_symbol,market_pair_basecurrency_id,market_pair_basecurrency_type,market_pair_quoteexchange_symbol,market_pair_quotecurrency_symbol,market_pair_quotecurrency_id,market_pair_quotecurrency_type,quoteexchange_reportedprice,quoteexchange_reportedvolume_24h_base,quoteexchange_reportedvolume_24h_quote,quoteexchange_reportedlast_updated,quoteUSDprice,quoteUSDvolume_24h,quoteUSDlast_updated,market_id,market_pair,category,fee_type) VALUES (NULL,NULL,1141,'Sushiswap','sushiswap','FXS','FXS',6953,'cryptocurrency','FRAX','FRAX',6952,'cryptocurrency',2.57359155109569,0,0,'2021-05-31T17:00:13.000Z',2.56974154176781,0,'2021-05-31T17:00:13.000Z',71344,'FXS/FRAX','spot','percentage');