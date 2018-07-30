<?php

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
            'id' => $this->primaryKey(11),
            'username' => $this->string(255)->notNull(),
            'password' => $this->string(255)->notNull(),
            'role' => $this->string(255)->notNull()->defaultValue('user'),
            //'PRIMARY KEY(id)',
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
