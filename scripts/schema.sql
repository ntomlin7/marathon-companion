DROP TABLE IF EXISTS item_sources;
DROP TABLE IF EXISTS item_mods;
DROP TABLE IF EXISTS item_stats;

DROP TABLE IF EXISTS mods;
DROP TABLE IF EXISTS mod_types;

DROP TABLE IF EXISTS sources;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS item_types;

DROP TYPE IF EXISTS rarity_type;

CREATE TYPE rarity_type as ENUM (
    'standard',
    'enhanced',
    'deluxe',
    'superior',
    'prestige',
    'contraband'
);

CREATE TABLE item_types (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    external_id TEXT, -- Here in case bungie ever releases an api. Then we can do everything from that and have a way to sync our db to theirs basically.
    name TEXT NOT NULL,
    type_id INTEGER NOT NULL REFERENCES item_types(id), -- Foreign Key to link item to an item type
    rarity rarity_type NOT NULL,
    description TEXT,
    icon TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_items_type ON items(type_id);
CREATE INDEX idx_items_external_id ON items(external_id); --For later if bungie releases API (idk if they will?)

CREATE TABLE item_stats ( --used incase bungie ever decides to add new stats into the game (no idea how likely this is but rather be extra cautious)
    id SERIAL PRIMARY KEY,
    item_id INTEGER NOT NULL REFERENCES items(id) ON DELETE CASCADE,
    stat_name TEXT NOT NULL,
    stat_value TEXT NOT NULL,
    UNIQUE(item_id, stat_name) -- prevents duplicate stats on an item (i.e id1. +10 agi id1 +20 agi)
);

CREATE INDEX idx_item_stats_item_id ON item_stats(item_id); --find all stats for an item
CREATE INDEX idx_item_stats_stat_name ON item_stats(stat_name); --find all items with certain stat

CREATE TABLE mod_types ( -- allows us to associate each mode with a certain type. i.e barrel or optic
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE mods (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    mod_type_id INTEGER NOT NULL REFERENCES mod_types(id), --fk to mod types
    rarity rarity_type NOT NULL,
    description TEXT,
    UNIQUE(name, rarity, mod_type_id) --allows us to have 2 attachments with same name but diff. rarity
);

CREATE TABLE item_mods ( --mods for a specific item
    item_id INTEGER REFERENCES items(id) ON DELETE CASCADE,
    mod_id INTEGER REFERENCES mods(id) ON DELETE CASCADE,
    PRIMARY KEY (item_id, mod_id)
);

CREATE TABLE sources (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT
);

CREATE TABLE item_sources(
    item_id INTEGER REFERENCES items(id) ON DELETE CASCADE,
    source_id INTEGER REFERENCES sources(id) ON DELETE CASCADE,
    PRIMARY KEY (item_id, source_id)
);