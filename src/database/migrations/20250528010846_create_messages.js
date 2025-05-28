exports.up = function (knex) {
    return knex.schema.createTable('messages', function (table) {
        table.increments('id').primary();
        table.integer('conversation_id').notNullable();
        table.integer('sender_id').notNullable();
        table.text('text').notNullable();
        table.string('image_url').notNullable();
        table.boolean('is_read').defaultTo(false);
        table.timestamps(true, true);

        table.foreign('conversation_id').references('id').inTable('conversations').onDelete('CASCADE');
        table.foreign('sender_id').references('user_id').inTable('users').onDelete('CASCADE');
    });
};

exports.down = function (knex) {
    return knex.schema.dropTable('messages');
};
