exports.up = function (knex) {
    return knex.schema.createTable('conversations', function (table) {
        table.increments('id').primary();
        table.integer('user1_id').notNullable();
        table.integer('user2_id').notNullable();
        table.timestamps(true, true);

        table.foreign('user1_id').references('user_id').inTable('users').onDelete('CASCADE');
        table.foreign('user2_id').references('user_id').inTable('users').onDelete('CASCADE');

        // Đảm bảo chỉ có một conversation giữa 2 người
        table.unique(['user1_id', 'user2_id']);
    });
};

exports.down = function (knex) {
    return knex.schema.dropTable('conversations');
};
