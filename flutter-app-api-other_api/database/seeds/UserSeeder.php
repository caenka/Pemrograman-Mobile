<?php

use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = [];
        $users[] = [
            'name' => 'Caesarina Kurnia Ananta',
            'email' => 'cae@gmail.com',
            'password' => bcrypt('123123'),
            'created_at' => now(),
            'updated_at' => null
        ];
        $users[] = [
            'name' => 'Calvin Catur Alfarizi',
            'email' => 'calvin@gmail.com',
            'password' => bcrypt('123123'),
            'created_at' => now(),
            'updated_at' => null
        ];
        $users[] = [
            'name' => 'Zihan Muhammad Al Ghifari',
            'email' => 'zihan@gmail.com',
            'password' => bcrypt('123123'),
            'created_at' => now(),
            'updated_at' => null
        ];

        DB::table('users')->insert($users);
        $this->command->info("Data Dummy User berhasil diinsert");
    }
}
