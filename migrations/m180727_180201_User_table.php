<?php

use yii\db\Schema;
use yii\db\Migration;

/**
 * Class m180727_180201_User_table
 */
class m180727_180201_User_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
		$tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE=InnoDB';
        }
		
			$this->createTable('user', [
				'id' => Schema::TYPE_PK,
				'username' => Schema::TYPE_STRING . ' NOT NULL',
				'auth_key' => Schema::TYPE_STRING . '(32) NOT NULL',
				'password_hash' => Schema::TYPE_STRING . ' NOT NULL',
				'password_reset_token' => Schema::TYPE_STRING,
        ], $tableOptions);
        
         // creates index for column `username`
        $this->createIndex('idx_user_username','user','username', true);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
		$this->dropIndex('idx_user_username','user');
		$this->dropTable('user');
    //    echo "m180727_180201_User_table cannot be reverted.\n";
     //   return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180727_180201_User_table cannot be reverted.\n";

        return false;
    }
    */
}
