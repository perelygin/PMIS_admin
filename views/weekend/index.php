<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\WeekendSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Weekends';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="weekends-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Weekends', ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Генерировать выходные', ['generate'], ['class' => 'btn btn-success']) ?>
    </p>
    
     
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            
            'weekend',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
