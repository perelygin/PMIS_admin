<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "settings".
 *
 * @property int $id_param
 * @property string $Prm_name
 * @property string $Prm_description
 * @property int $Prm_enum_id id  значения параметра
 * @property int $deleted
 *
 * @property EnumSettings[] $enumSettings
 */
class Settings extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'settings';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Prm_enum_id', 'deleted'], 'integer'],
            [['Prm_name'], 'string', 'max' => 100],
            [['Prm_description'], 'string', 'max' => 2000],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_param' => 'Id Param',
            'Prm_name' => 'Название параметра',
            'Prm_description' => 'Описание параметра',
            'Prm_enum_id' => 'Значение параметра',
            'deleted' => 'Deleted',
        ];
    }
    //Есть ли у параметра такое значение параметра
	public function is_HaveParamValue($Prm_enum_id){
		$sql = "SELECT count(id_param) FROM Yii2pmis.settings where Prm_enum_id = ".$Prm_enum_id;
	    $count = Yii::$app->db->createCommand($sql)->queryScalar();
	    
		if ($count>0){
			
			return true;
			} else {
				return false;
			}
	}
    
}
