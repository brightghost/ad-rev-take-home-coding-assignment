-- ============================================================
-- Conversion Journey Assessment — Seed Data
-- Copy this file into your Flyway migrations folder
-- (e.g. src/main/resources/db/migration/V2__seed_data.sql)
-- ============================================================

-- ── Conversions ──────────────────────────────────────────────
-- 50 conversions for advertiser 'adv-demo-001'
-- Distribution: ~15 CHECKOUT, ~20 LEAD, ~15 PAGE_VISIT
-- Date range: May 1–21, 2026

INSERT INTO conversion (id, advertiser_id, conversion_date, type, subcategory, revenue) VALUES
-- Path: Google → Meta → Direct (12 conversions)
('c001', 'adv-demo-001', '2026-05-20 14:30:00', 'CHECKOUT', 'purchase', 2450.00),
('c002', 'adv-demo-001', '2026-05-19 09:15:00', 'LEAD',     'contactus', NULL),
('c003', 'adv-demo-001', '2026-05-18 16:45:00', 'CHECKOUT', 'purchase', 890.00),
('c004', 'adv-demo-001', '2026-05-17 11:20:00', 'LEAD',     'newsletter', NULL),
('c005', 'adv-demo-001', '2026-05-16 08:00:00', 'PAGE_VISIT','homepage', NULL),
('c006', 'adv-demo-001', '2026-05-15 13:30:00', 'CHECKOUT', 'purchase', 1750.00),
('c007', 'adv-demo-001', '2026-05-14 10:10:00', 'LEAD',     'contactus', NULL),
('c008', 'adv-demo-001', '2026-05-12 15:45:00', 'LEAD',     'demo_request', NULL),
('c009', 'adv-demo-001', '2026-05-10 09:00:00', 'PAGE_VISIT','pricing', NULL),
('c010', 'adv-demo-001', '2026-05-08 14:20:00', 'CHECKOUT', 'purchase', 3200.00),
('c011', 'adv-demo-001', '2026-05-05 11:00:00', 'LEAD',     'contactus', NULL),
('c012', 'adv-demo-001', '2026-05-03 16:30:00', 'CHECKOUT', 'purchase', 560.00),

-- Path: Programmatic → Google (8 conversions)
('c013', 'adv-demo-001', '2026-05-20 10:00:00', 'LEAD',     'contactus', NULL),
('c014', 'adv-demo-001', '2026-05-18 08:30:00', 'PAGE_VISIT','homepage', NULL),
('c015', 'adv-demo-001', '2026-05-16 14:15:00', 'LEAD',     'newsletter', NULL),
('c016', 'adv-demo-001', '2026-05-14 17:00:00', 'CHECKOUT', 'purchase', 1100.00),
('c017', 'adv-demo-001', '2026-05-12 09:45:00', 'LEAD',     'demo_request', NULL),
('c018', 'adv-demo-001', '2026-05-09 11:30:00', 'PAGE_VISIT','features', NULL),
('c019', 'adv-demo-001', '2026-05-06 13:00:00', 'CHECKOUT', 'purchase', 4200.00),
('c020', 'adv-demo-001', '2026-05-02 10:20:00', 'LEAD',     'contactus', NULL),

-- Path: Meta → Programmatic → Google → Direct (6 conversions)
('c021', 'adv-demo-001', '2026-05-19 11:00:00', 'CHECKOUT', 'purchase', 890.00),
('c022', 'adv-demo-001', '2026-05-17 15:30:00', 'LEAD',     'newsletter', NULL),
('c023', 'adv-demo-001', '2026-05-14 09:00:00', 'CHECKOUT', 'purchase', 2100.00),
('c024', 'adv-demo-001', '2026-05-11 14:45:00', 'LEAD',     'contactus', NULL),
('c025', 'adv-demo-001', '2026-05-07 08:15:00', 'PAGE_VISIT','pricing', NULL),
('c026', 'adv-demo-001', '2026-05-04 16:00:00', 'LEAD',     'demo_request', NULL),

-- Path: Google → Direct (6 conversions)
('c027', 'adv-demo-001', '2026-05-19 16:00:00', 'LEAD',     'contactus', NULL),
('c028', 'adv-demo-001', '2026-05-17 10:30:00', 'PAGE_VISIT','homepage', NULL),
('c029', 'adv-demo-001', '2026-05-15 08:45:00', 'CHECKOUT', 'purchase', 1200.00),
('c030', 'adv-demo-001', '2026-05-11 12:00:00', 'LEAD',     'newsletter', NULL),
('c031', 'adv-demo-001', '2026-05-08 09:30:00', 'PAGE_VISIT','features', NULL),
('c032', 'adv-demo-001', '2026-05-04 14:00:00', 'LEAD',     'contactus', NULL),

-- Path: Direct only (5 conversions)
('c033', 'adv-demo-001', '2026-05-18 12:00:00', 'CHECKOUT', 'purchase', 1200.00),
('c034', 'adv-demo-001', '2026-05-15 10:00:00', 'PAGE_VISIT','homepage', NULL),
('c035', 'adv-demo-001', '2026-05-12 14:30:00', 'LEAD',     'contactus', NULL),
('c036', 'adv-demo-001', '2026-05-07 16:45:00', 'PAGE_VISIT','pricing', NULL),
('c037', 'adv-demo-001', '2026-05-03 09:00:00', 'CHECKOUT', 'purchase', 750.00),

-- Path: Meta → Direct (4 conversions)
('c038', 'adv-demo-001', '2026-05-20 08:00:00', 'LEAD',     'newsletter', NULL),
('c039', 'adv-demo-001', '2026-05-16 11:30:00', 'PAGE_VISIT','homepage', NULL),
('c040', 'adv-demo-001', '2026-05-10 15:00:00', 'CHECKOUT', 'purchase', 1800.00),
('c041', 'adv-demo-001', '2026-05-05 08:30:00', 'LEAD',     'contactus', NULL),

-- Path: Programmatic → Meta → Google (4 conversions)
('c042', 'adv-demo-001', '2026-05-21 09:00:00', 'CHECKOUT', 'purchase', 3500.00),
('c043', 'adv-demo-001', '2026-05-18 14:00:00', 'LEAD',     'demo_request', NULL),
('c044', 'adv-demo-001', '2026-05-13 10:30:00', 'PAGE_VISIT','features', NULL),
('c045', 'adv-demo-001', '2026-05-06 16:15:00', 'LEAD',     'contactus', NULL),

-- Mixed / other paths (5 conversions)
('c046', 'adv-demo-001', '2026-05-21 11:30:00', 'LEAD',     'newsletter', NULL),  -- Google only
('c047', 'adv-demo-001', '2026-05-20 17:00:00', 'PAGE_VISIT','homepage', NULL),   -- Meta → Google → Meta → Direct
('c048', 'adv-demo-001', '2026-05-13 08:00:00', 'CHECKOUT', 'purchase', 5000.00), -- Programmatic → Direct
('c049', 'adv-demo-001', '2026-05-09 13:45:00', 'LEAD',     'contactus', NULL),   -- Meta only
('c050', 'adv-demo-001', '2026-05-01 10:00:00', 'PAGE_VISIT','pricing', NULL);    -- Google → Programmatic → Direct


-- ── Touchpoints ──────────────────────────────────────────────

-- Path: Google → Meta → Direct (c001–c012)
INSERT INTO touchpoint (id, conversion_id, channel, channel_detail, impression_date, sequence_index) VALUES
('t001', 'c001', 'GOOGLE',  'Google Search',       '2026-05-14 10:00:00', 1),
('t002', 'c001', 'META',    'Meta Retarget',        '2026-05-17 18:00:00', 2),
('t003', 'c001', 'DIRECT',  'Direct',               '2026-05-20 14:00:00', 3),
('t004', 'c002', 'GOOGLE',  'Google Brand',         '2026-05-13 08:00:00', 1),
('t005', 'c002', 'META',    'Meta Lookalike',        '2026-05-16 14:00:00', 2),
('t006', 'c002', 'DIRECT',  'Direct',               '2026-05-19 09:00:00', 3),
('t007', 'c003', 'GOOGLE',  'Google PMax',          '2026-05-12 09:00:00', 1),
('t008', 'c003', 'META',    'Meta Retarget',        '2026-05-15 11:00:00', 2),
('t009', 'c003', 'DIRECT',  'Direct',               '2026-05-18 16:30:00', 3),
('t010', 'c004', 'GOOGLE',  'Google Search',        '2026-05-10 14:00:00', 1),
('t011', 'c004', 'META',    'Meta Prospecting',      '2026-05-14 09:00:00', 2),
('t012', 'c004', 'DIRECT',  'Direct',               '2026-05-17 11:00:00', 3),
('t013', 'c005', 'GOOGLE',  'Google Brand',         '2026-05-11 10:00:00', 1),
('t014', 'c005', 'META',    'Meta Retarget',        '2026-05-14 16:00:00', 2),
('t015', 'c005', 'DIRECT',  'Direct',               '2026-05-16 07:30:00', 3),
('t016', 'c006', 'GOOGLE',  'Google Search',        '2026-05-08 08:00:00', 1),
('t017', 'c006', 'META',    'Meta Lookalike',        '2026-05-12 12:00:00', 2),
('t018', 'c006', 'DIRECT',  'Direct',               '2026-05-15 13:00:00', 3),
('t019', 'c007', 'GOOGLE',  'Google PMax',          '2026-05-09 11:00:00', 1),
('t020', 'c007', 'META',    'Meta Retarget',        '2026-05-12 08:00:00', 2),
('t021', 'c007', 'DIRECT',  'Direct',               '2026-05-14 10:00:00', 3),
('t022', 'c008', 'GOOGLE',  'Google Search',        '2026-05-06 09:00:00', 1),
('t023', 'c008', 'META',    'Meta Prospecting',      '2026-05-09 15:00:00', 2),
('t024', 'c008', 'DIRECT',  'Direct',               '2026-05-12 15:30:00', 3),
('t025', 'c009', 'GOOGLE',  'Google Brand',         '2026-05-05 10:00:00', 1),
('t026', 'c009', 'META',    'Meta Retarget',        '2026-05-08 13:00:00', 2),
('t027', 'c009', 'DIRECT',  'Direct',               '2026-05-10 08:30:00', 3),
('t028', 'c010', 'GOOGLE',  'Google Search',        '2026-05-02 14:00:00', 1),
('t029', 'c010', 'META',    'Meta Lookalike',        '2026-05-05 10:00:00', 2),
('t030', 'c010', 'DIRECT',  'Direct',               '2026-05-08 14:00:00', 3),
('t031', 'c011', 'GOOGLE',  'Google PMax',          '2026-05-01 08:00:00', 1),
('t032', 'c011', 'META',    'Meta Retarget',        '2026-05-03 14:00:00', 2),
('t033', 'c011', 'DIRECT',  'Direct',               '2026-05-05 10:30:00', 3),
('t034', 'c012', 'GOOGLE',  'Google Search',        '2026-05-01 10:00:00', 1),
('t035', 'c012', 'META',    'Meta Prospecting',      '2026-05-02 09:00:00', 2),
('t036', 'c012', 'DIRECT',  'Direct',               '2026-05-03 16:00:00', 3),

-- Path: Programmatic → Google (c013–c020)
('t037', 'c013', 'PROGRAMMATIC', 'Programmatic CTV',    '2026-05-17 20:00:00', 1),
('t038', 'c013', 'GOOGLE',       'Google Brand',        '2026-05-20 09:30:00', 2),
('t039', 'c014', 'PROGRAMMATIC', 'Programmatic Display', '2026-05-15 10:00:00', 1),
('t040', 'c014', 'GOOGLE',       'Google Search',       '2026-05-18 08:00:00', 2),
('t041', 'c015', 'PROGRAMMATIC', 'Programmatic CTV',    '2026-05-12 19:00:00', 1),
('t042', 'c015', 'GOOGLE',       'Google PMax',         '2026-05-16 14:00:00', 2),
('t043', 'c016', 'PROGRAMMATIC', 'Programmatic Display', '2026-05-10 08:00:00', 1),
('t044', 'c016', 'GOOGLE',       'Google Search',       '2026-05-14 16:30:00', 2),
('t045', 'c017', 'PROGRAMMATIC', 'Programmatic CTV',    '2026-05-08 21:00:00', 1),
('t046', 'c017', 'GOOGLE',       'Google Brand',        '2026-05-12 09:00:00', 2),
('t047', 'c018', 'PROGRAMMATIC', 'Programmatic Display', '2026-05-05 14:00:00', 1),
('t048', 'c018', 'GOOGLE',       'Google Search',       '2026-05-09 11:00:00', 2),
('t049', 'c019', 'PROGRAMMATIC', 'Programmatic CTV',    '2026-05-02 20:00:00', 1),
('t050', 'c019', 'GOOGLE',       'Google PMax',         '2026-05-06 12:30:00', 2),
('t051', 'c020', 'PROGRAMMATIC', 'Programmatic Display', '2026-05-01 09:00:00', 1),
('t052', 'c020', 'GOOGLE',       'Google Search',       '2026-05-02 10:00:00', 2),

-- Path: Meta → Programmatic → Google → Direct (c021–c026)
('t053', 'c021', 'META',          'Meta Lookalike',        '2026-05-07 10:00:00', 1),
('t054', 'c021', 'PROGRAMMATIC',  'Programmatic Display',  '2026-05-11 14:00:00', 2),
('t055', 'c021', 'GOOGLE',        'Google Search',         '2026-05-16 09:00:00', 3),
('t056', 'c021', 'DIRECT',        'Direct',                '2026-05-19 10:30:00', 4),
('t057', 'c022', 'META',          'Meta Prospecting',      '2026-05-06 08:00:00', 1),
('t058', 'c022', 'PROGRAMMATIC',  'Programmatic CTV',      '2026-05-10 20:00:00', 2),
('t059', 'c022', 'GOOGLE',        'Google Brand',          '2026-05-14 11:00:00', 3),
('t060', 'c022', 'DIRECT',        'Direct',                '2026-05-17 15:00:00', 4),
('t061', 'c023', 'META',          'Meta Retarget',         '2026-05-03 14:00:00', 1),
('t062', 'c023', 'PROGRAMMATIC',  'Programmatic Display',  '2026-05-07 10:00:00', 2),
('t063', 'c023', 'GOOGLE',        'Google Search',         '2026-05-11 08:00:00', 3),
('t064', 'c023', 'DIRECT',        'Direct',                '2026-05-14 08:30:00', 4),
('t065', 'c024', 'META',          'Meta Lookalike',        '2026-05-02 09:00:00', 1),
('t066', 'c024', 'PROGRAMMATIC',  'Programmatic CTV',      '2026-05-05 19:00:00', 2),
('t067', 'c024', 'GOOGLE',        'Google PMax',           '2026-05-08 14:00:00', 3),
('t068', 'c024', 'DIRECT',        'Direct',                '2026-05-11 14:30:00', 4),
('t069', 'c025', 'META',          'Meta Prospecting',      '2026-05-01 11:00:00', 1),
('t070', 'c025', 'PROGRAMMATIC',  'Programmatic Display',  '2026-05-03 15:00:00', 2),
('t071', 'c025', 'GOOGLE',        'Google Search',         '2026-05-05 10:00:00', 3),
('t072', 'c025', 'DIRECT',        'Direct',                '2026-05-07 08:00:00', 4),
('t073', 'c026', 'META',          'Meta Retarget',         '2026-05-01 08:00:00', 1),
('t074', 'c026', 'PROGRAMMATIC',  'Programmatic CTV',      '2026-05-02 20:00:00', 2),
('t075', 'c026', 'GOOGLE',        'Google Brand',          '2026-05-03 11:00:00', 3),
('t076', 'c026', 'DIRECT',        'Direct',                '2026-05-04 15:30:00', 4),

-- Path: Google → Direct (c027–c032)
('t077', 'c027', 'GOOGLE',  'Google Search',  '2026-05-18 09:00:00', 1),
('t078', 'c027', 'DIRECT',  'Direct',         '2026-05-19 15:30:00', 2),
('t079', 'c028', 'GOOGLE',  'Google PMax',    '2026-05-16 14:00:00', 1),
('t080', 'c028', 'DIRECT',  'Direct',         '2026-05-17 10:00:00', 2),
('t081', 'c029', 'GOOGLE',  'Google Brand',   '2026-05-12 08:00:00', 1),
('t082', 'c029', 'DIRECT',  'Direct',         '2026-05-15 08:30:00', 2),
('t083', 'c030', 'GOOGLE',  'Google Search',  '2026-05-09 10:00:00', 1),
('t084', 'c030', 'DIRECT',  'Direct',         '2026-05-11 11:30:00', 2),
('t085', 'c031', 'GOOGLE',  'Google PMax',    '2026-05-04 11:00:00', 1),
('t086', 'c031', 'DIRECT',  'Direct',         '2026-05-08 09:00:00', 2),
('t087', 'c032', 'GOOGLE',  'Google Brand',   '2026-05-01 09:00:00', 1),
('t088', 'c032', 'DIRECT',  'Direct',         '2026-05-04 13:30:00', 2),

-- Path: Direct only (c033–c037)
('t089', 'c033', 'DIRECT',  'Direct',  '2026-05-18 11:45:00', 1),
('t090', 'c034', 'DIRECT',  'Direct',  '2026-05-15 09:45:00', 1),
('t091', 'c035', 'DIRECT',  'Direct',  '2026-05-12 14:15:00', 1),
('t092', 'c036', 'DIRECT',  'Direct',  '2026-05-07 16:30:00', 1),
('t093', 'c037', 'DIRECT',  'Direct',  '2026-05-03 08:45:00', 1),

-- Path: Meta → Direct (c038–c041)
('t094', 'c038', 'META',    'Meta Prospecting',  '2026-05-16 10:00:00', 1),
('t095', 'c038', 'DIRECT',  'Direct',            '2026-05-20 07:30:00', 2),
('t096', 'c039', 'META',    'Meta Retarget',     '2026-05-13 08:00:00', 1),
('t097', 'c039', 'DIRECT',  'Direct',            '2026-05-16 11:00:00', 2),
('t098', 'c040', 'META',    'Meta Lookalike',    '2026-05-06 14:00:00', 1),
('t099', 'c040', 'DIRECT',  'Direct',            '2026-05-10 14:30:00', 2),
('t100', 'c041', 'META',    'Meta Retarget',     '2026-05-02 11:00:00', 1),
('t101', 'c041', 'DIRECT',  'Direct',            '2026-05-05 08:00:00', 2),

-- Path: Programmatic → Meta → Google (c042–c045)
('t102', 'c042', 'PROGRAMMATIC', 'Programmatic CTV',    '2026-05-13 20:00:00', 1),
('t103', 'c042', 'META',         'Meta Retarget',       '2026-05-17 10:00:00', 2),
('t104', 'c042', 'GOOGLE',       'Google Search',       '2026-05-21 08:30:00', 3),
('t105', 'c043', 'PROGRAMMATIC', 'Programmatic Display', '2026-05-12 09:00:00', 1),
('t106', 'c043', 'META',         'Meta Lookalike',       '2026-05-15 14:00:00', 2),
('t107', 'c043', 'GOOGLE',       'Google Brand',        '2026-05-18 13:30:00', 3),
('t108', 'c044', 'PROGRAMMATIC', 'Programmatic CTV',    '2026-05-07 19:00:00', 1),
('t109', 'c044', 'META',         'Meta Prospecting',     '2026-05-10 11:00:00', 2),
('t110', 'c044', 'GOOGLE',       'Google PMax',         '2026-05-13 10:00:00', 3),
('t111', 'c045', 'PROGRAMMATIC', 'Programmatic Display', '2026-05-01 14:00:00', 1),
('t112', 'c045', 'META',         'Meta Retarget',       '2026-05-04 08:00:00', 2),
('t113', 'c045', 'GOOGLE',       'Google Search',       '2026-05-06 16:00:00', 3),

-- Mixed paths (c046–c050)
-- c046: Google only
('t114', 'c046', 'GOOGLE',  'Google Search',  '2026-05-21 09:00:00', 1),

-- c047: Meta → Google → Meta → Direct (interesting multi-touch)
('t115', 'c047', 'META',    'Meta Prospecting',   '2026-05-12 10:00:00', 1),
('t116', 'c047', 'GOOGLE',  'Google Search',      '2026-05-15 14:00:00', 2),
('t117', 'c047', 'META',    'Meta Retarget',      '2026-05-18 08:00:00', 3),
('t118', 'c047', 'DIRECT',  'Direct',             '2026-05-20 16:30:00', 4),

-- c048: Programmatic → Direct
('t119', 'c048', 'PROGRAMMATIC', 'Programmatic CTV', '2026-05-08 20:00:00', 1),
('t120', 'c048', 'DIRECT',       'Direct',           '2026-05-13 07:30:00', 2),

-- c049: Meta only
('t121', 'c049', 'META',  'Meta Lookalike', '2026-05-09 12:00:00', 1),

-- c050: Google → Programmatic → Direct
('t122', 'c050', 'GOOGLE',       'Google Brand',          '2026-04-22 08:00:00', 1),
('t123', 'c050', 'PROGRAMMATIC', 'Programmatic Display',  '2026-04-27 14:00:00', 2),
('t124', 'c050', 'DIRECT',       'Direct',                '2026-05-01 09:30:00', 3);
