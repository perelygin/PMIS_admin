<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "setings".
 *
 * @property int $id_param
 * @property string $Prm_name
 * @property string $Prm_description
 * @property int $Prm_num_value
 * @property string $Prm_str_value
 * @property int $Prm_type 1- параметр перечисление
 *
 * @property EnumSetings[] $enumSetings
 */
class Setings extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'setings';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Prm_num_value', 'Prm_type'], 'integer'],
            [['Prm_name'], 'string', 'max' => 100],
            [['Prm_description'], 'string', 'max' => 2000],
            [['Prm_str_value'], 'string', 'max' => 500],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_param' => 'Id Param',
            'Prm_name' => 'Prm Name',
            'Prm_description' => 'Prm Description',
            'Prm_num_value' => 'Prm Num Value',
            'Prm_str_value' => 'Prm Str Value',
            'Prm_type' => 'Prm Type',
        ];
    }

 
}
