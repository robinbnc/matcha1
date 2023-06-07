USE matcha;

CREATE TABLE IF NOT EXISTS `tag` (
    `id`     INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `label`  VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS `profile` (
    `id`                   INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `gender`               VARCHAR(100) DEFAULT 'Not specified',
    `birth_date`           DATE,
    `sexual_preferences`   VARCHAR(100) DEFAULT 'bisexual',
    `biography`            VARCHAR(510),
    `location`             VARCHAR(100),
    `fame_rate`            INTEGER DEFAULT 100
);

CREATE TABLE IF NOT EXISTS `profile_tag` (
    `profile_id`           INTEGER NOT NULL,
    `tag_id`               INTEGER NOT NULL,
    FOREIGN KEY (`profile_id`) REFERENCES `profile`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (`tag_id`) REFERENCES `tag`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (`profile_id`, `tag_id`)
);

CREATE TABLE IF NOT EXISTS `picture` (
    `id`                   INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `profile_id`           INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE,
    `url`                  VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `profile_default_picture` (
    `profile_id`           INTEGER NOT NULL,
    `picture_id`           INTEGER NOT NULL,
    FOREIGN KEY (`profile_id`) REFERENCES `profile`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (`picture_id`) REFERENCES `picture`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (`profile_id`, `picture_id`)
);

CREATE TABLE IF NOT EXISTS `like` (
    `id`                   INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `profile_id`           INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE,
    `liked_profile_id`     INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE,
    `date`                 DATE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `view` (
    `id`                   INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `profile_id`           INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE,
    `viewed_profile_id`    INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE,
    `date`                 DATE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `blacklist` (
    `id`                   INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `profile_id`           INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE,
    `blacklisted_profile_id`   INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE,
    `date`                 DATE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `fake_report` (
    `id`                   INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `profile_id`           INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE,
    `fake_reported_profile_id`   INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE,
    `date`                 DATE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `user` (
    `id`                   INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `last_name`            VARCHAR(100) NOT NULL,
    `first_name`           VARCHAR(100) NOT NULL,
    `email`                VARCHAR(255) NOT NULL UNIQUE,
    `password`             VARCHAR(255) NOT NULL,
    `profile_id`           INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `messages` (
    `id`                   INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `from`                 INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE,
    `to`                   INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE,
    `message`              VARCHAR(510) NOT NULL,
    `date`                 DATE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `notification` (
    `id`                   INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `is_viewed`            BIT DEFAULT 0,
    `from`                 INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE,
    `to`                   INTEGER REFERENCES `profile`(`id`) ON DELETE CASCADE,
    `type`                 VARCHAR(510) NOT NULL,
    `date`                 DATE DEFAULT CURRENT_TIMESTAMP
);
