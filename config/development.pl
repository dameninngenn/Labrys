+{
    'DBI' => [
        "dbi:mysql:labrys",
        'root',
        '',
        +{
            mysql_enable_utf8 => 1,
        },
    ],
    'gf' => {
        base_url => 'http://localhost:5125/api/Labrys/',
    }
};
