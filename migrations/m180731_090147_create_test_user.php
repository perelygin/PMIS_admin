<?php

use yii\db\Migration;
use app\models\User;
/**
 * Class m180731_090147_create_test_user
 */
class m180731_090147_create_test_user extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
		$testUser = new User();
		$testUser->username = 'admin';
		$testUser->setPassword('admin');
		$testUser->generateAuthKey();
		$testUser->save();
	    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        User::findByUsername('turbulence')->delete();
		return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180731_090147_create_test_user cannot be reverted.\n";

        return false;
    }
    */
}
