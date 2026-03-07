LOAD DATABASE
  FROM sqlite:///data/cms.db
  INTO postgresql://admin:admin@localhost:5432/astro-naut
WITH include drop, create tables, create indexes, reset sequences
SET work_mem to '16MB', maintenance_work_mem to '512MB';
