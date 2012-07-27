CREATE TABLE IF NOT EXISTS url_history (
    url_history_id int unsigned NOT NULL auto_increment,
    url_history_type tinyint NOT NULL DEFAULT 0,
    url varchar(512) NOT NULL,
    remote_addr varchar(16) NOT NULL,
    created_at DATETIME NOT NULL,
    PRIMARY KEY (url_history_id),
    INDEX (created_at,url_history_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
