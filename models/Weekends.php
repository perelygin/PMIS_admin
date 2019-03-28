<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Weekends".
 *
 * @property int $idWeekends
 * @property string $weekend
 */
class Weekends extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Weekends';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['weekend'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idWeekends' => 'Id Weekends',
            'weekend' => 'Weekend',
        ];
    }
}
