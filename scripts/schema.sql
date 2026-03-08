DROP TABLE IF EXISTS item_sources;
DROP TABLE IF EXISTS item_mods;
DROP TABLE IF EXISTS item_stats;
DROP TABLE IF EXISTS mods;
DROP TABLE IF EXISTS sources;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS item_types;

CREATE TABLE item_types (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    external_id TEXT, -- Here in case bungie ever releases an api. Then we can do everything from that and have a way to sync our db to theirs basically.
    name TEXT NOT NULL,
    type_id INTEGER REFERENCES item_types(id), -- Foreign Key to link item to an item type
    rarity TEXT,
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
    stat_value TEXT NOT NULL
);

CREATE INDEX idx_item_stats_item_id ON item_stats(item_id);

CREATE TABLE mods (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE item_mods (
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