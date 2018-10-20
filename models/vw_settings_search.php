<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\vw_settings;

/**
 * vw_settings_search represents the model behind the search form of `app\models\vw_settings`.
 */
class vw_settings_search extends vw_settings
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_param', 'Prm_enum_id'], 'integer'],
            [['Prm_name', 'Prm_description', 'enm_str_value'], 'safe'],
            [['enm_num_value'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = vw_settings::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id_param' => $this->id_param,
            'Prm_enum_id' => $this->Prm_enum_id,
            'enm_num_value' => $this->enm_num_value,
        ]);

        $query->andFilterWhere(['like', 'Prm_name', $this->Prm_name])
            ->andFilterWhere(['like', 'Prm_description', $this->Prm_description])
            ->andFilterWhere(['like', 'enm_str_value', $this->enm_str_value]);

        return $dataProvider;
    }
}
