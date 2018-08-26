<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "People".
 *
 * @property int $idHuman
 * @property string $Name
 * @property string $Family
 * @property int $idOrganization организация,  сотрудником которой является человек
 *
 * @property BusinessRequests[] $businessRequests
 * @property Organization $organization
 * @property ProjectCommand[] $projectCommands
 */
class People extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'People';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idOrganization'], 'integer'],
            [['Name', 'Family'], 'string', 'max' => 45],
            [['idOrganization'], 'exist', 'skipOnError' => true, 'targetClass' => Organization::className(), 'targetAttribute' => ['idOrganization' => 'idOrganization']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idHuman' => 'Id Human',
            'Name' => 'Name',
            'Family' => 'Family',
            'idOrganization' => 'Id Organization',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBusinessRequests()
    {
        return $this->hasMany(BusinessRequests::className(), ['BRCurrentResponsible' => 'idHuman']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrganization()
    {
        return $this->hasOne(Organization::className(), ['idOrganization' => 'idOrganization']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjectCommands()
    {
        return $this->hasMany(ProjectCommand::className(), ['idHuman' => 'idHuman']);
    }
}
