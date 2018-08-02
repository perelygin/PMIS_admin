<?php

use yii\db\Migration;

/**
 * Class m180801_165735_add_email_for_user
 */
class m180801_165735_add_email_for_user extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
		$this->addColumn('user', 'email', $this->string(64)->after('id'));
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180801_165735_add_email_for_user cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180801_165735_add_email_for_user cannot be reverted.\n";

        return false;
    }
    */
}
