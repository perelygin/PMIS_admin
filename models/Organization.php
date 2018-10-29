<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Organization".
 *
 * @property int $idOrganization
 * @property string $CustomerName
 * @property string $ShortName
 * @property int $deleted
 *
 * @property People[] $peoples
 * @property Projects[] $projects
 * @property Wbs[] $wbs
 */
class Organization extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Organization';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['deleted'], 'integer'],
            [['CustomerName'], 'string', 'max' => 120],
            [['ShortName'], 'string', 'max' => 45],
            [['ShortName'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idOrganization' => 'Id Organization',
            'CustomerName' => 'Customer Name',
            'ShortName' => 'Short Name',
            'deleted' => 'Deleted',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPeoples()
    {
        return $this->hasMany(People::className(), ['idOrganization' => 'idOrganization']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjects()
    {
        return $this->hasMany(Projects::className(), ['idOrganization' => 'idOrganization']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWbs()
    {
        return $this->hasMany(Wbs::className(), ['idOrgResponsible' => 'idOrganization']);
    }
}
