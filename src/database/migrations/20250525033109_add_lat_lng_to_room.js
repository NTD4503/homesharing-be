exports.up = function (knex) {
    return knex.schema.table('room', function (table) {
        table.decimal('lat', 10, 7);
        table.decimal('lng', 10, 7);
    });
};

exports.down = function (knex) {
    return knex.schema.table('room', function (table) {
        table.dropColumn('lat');
        table.dropColumn('lng');
    });
};
