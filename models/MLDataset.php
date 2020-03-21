<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ML_dataset".
 *
 * @property int $id_work
 * @property int $BR_number
 * @property string $WorkName
 * @property string $Analit_name
 * @property string $Work_descr
 * @property int $workEffort
 * @property string $mantisNumber
 */
class MLDataset extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ML_dataset';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['BR_number', 'idWorksOfEstimate'], 'integer'],
            [['workEffort'], 'double'],
            [['Work_descr'], 'string'],
            [['WorkName'], 'string', 'max' => 145],
            [['Analit_name', 'mantisNumber'], 'string', 'max' => 45],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_work' => 'Id Work',
            'BR_number' => 'Br Number',
            'WorkName' => 'Work Name',
            'Analit_name' => 'Analit Name',
            'Work_descr' => 'Work Descr',
            'workEffort' => 'Work Effort',
            'mantisNumber' => 'Mantis Number',
        ];
    }
}
