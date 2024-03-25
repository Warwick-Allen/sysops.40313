-- Change the admin password to "adm1n".

UPDATE
  user
SET
  `password` = 'f53ea24bede17bfa17968693b3bf27d4be6af80de12a236c93204a0abaffb5be7e1f0c596e3662d22672cf5ed57ed988fe16',
  `updated` = '2024-03-24 09:05:49',
  `last_seen_at` = '2024-03-24 09:05:49'
WHERE
  `id` = 1;

INSERT INTO
  user_auth_token
VALUES
  (
    1,
    1,
    '5a67da18ff368b328f4f04ceedeeed21adbe3fc8a6ff2a226c27c1c1c2de88fc',
    '5a67da18ff368b328f4f04ceedeeed21adbe3fc8a6ff2a226c27c1c1c2de88fc',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:124.0) Gecko/20100101 Firefox/124.0',
    '172.23.0.1',
    1,
    1711271149,
    1711271127,
    1711271127,
    1711271127,
    0
  );

INSERT INTO
  sqlite_sequence
VALUES
  ('user_auth_token', 1);
