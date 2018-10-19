<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "EnumSetings".
 *
 * @property int $idEnumSetings
 * @property int $id_param
 * @property int $enm_num_value
 * @property string $enm_str_value
 *
 * @property Setings $param
 */
class EnumSetings extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'EnumSetings';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_param', 'enm_num_value'], 'integer'],
            [['enm_str_value'], 'string', 'max' => 500],
           
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idEnumSetings' => 'Id Enum Setings',
            'id_param' => 'Id Param',
            'enm_num_value' => 'Enm Num Value',
            'enm_str_value' => 'Enm Str Value',
        ];
    }

   
}
