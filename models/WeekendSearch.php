<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Weekends;

/**
 * WeekendSearch represents the model behind the search form of `app\models\Weekends`.
 */
class WeekendSearch extends Weekends
{
	//public $DateBegin;
	//public $DateEnd;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idWeekends'], 'integer'],
            [['weekend'], 'safe'],
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
        $query = Weekends::find();

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
            'idWeekends' => $this->idWeekends,
            'weekend' => $this->weekend,
        ]);

        return $dataProvider;
    }
}
