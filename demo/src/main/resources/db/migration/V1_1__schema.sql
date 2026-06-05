
CREATE TABLE IF NOT EXISTS conversions (
    id varchar(50) PRIMARY KEY,
    advertiser_id varchar(100) NOT NULL,
    conversion_date timestamp NOT NULL,
    type varchar(20) NOT NULL,
    subcategory varchar(100),
    revenue numeric(12,2)
);

CREATE TABLE IF NOT EXISTS touchpoints (
    id varchar(50) PRIMARY KEY,
    conversion_id varchar(50) NOT NULL REFERENCES conversions(id),
    channel varchar(30) NOT NULL,
    channel_detail varchar(255),
    impression_date timestamp NOT NULL,
    sequence_index integer NOT NULL
);