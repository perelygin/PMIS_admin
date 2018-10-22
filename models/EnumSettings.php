<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "EnumSettings".
 *
 * @property int $idEnumSettings
 * @property int $id_param
 * @property int $enm_num_value
 * @property string $enm_str_value
 *
 * @property Settings $param
 */
class EnumSettings extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'EnumSettings';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_param'], 'integer'],
            [['enm_num_value'],'number'],
            [['enm_str_value'], 'string', 'max' => 500],
          
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idEnumSettings' => 'Id Enum Settings',
            'id_param' => 'Id Param',
            'enm_num_value' => 'Число',
            'enm_str_value' => 'Строка',
        ];
    }

    
}
