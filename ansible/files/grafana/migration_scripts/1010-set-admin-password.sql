-- Change the admin password to "adm1n".

UPDATE
  `user`
SET
  `password` = '02eff6506b8b21bfa2e20fe0a9edfdfe5bab17a8276cd9a6a1a5e8afae6129ff8d911d8a66a7238876aae9a6c2c33e75c42d',
  `updated` = CURRENT_TIMESTAMP,
  `last_seen_at` = CURRENT_TIMESTAMP
WHERE
  `id` = 1;

INSERT INTO
  user_auth_token
VALUES
  (
    1,
    1,
    'e7708855adedeb2e561ac876f0ba8edac7db47fd8ea1f693740f4467741c7500',
    'e7708855adedeb2e561ac876f0ba8edac7db47fd8ea1f693740f4467741c7500',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:124.0) Gecko/20100101 Firefox/124.0',
    '172.20.0.1',
    1,
    {{ ansible_date_time.epoch }},
    {{ ansible_date_time.epoch }},
    {{ ansible_date_time.epoch }},
    {{ ansible_date_time.epoch }},
    0
  );

INSERT INTO
  sqlite_sequence
VALUES
  ('user_auth_token', 1);
