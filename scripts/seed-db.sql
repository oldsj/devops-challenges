CREATE TABLE team_history
(
    id bigint NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name text NOT NULL,
    team text NOT NULL
);
