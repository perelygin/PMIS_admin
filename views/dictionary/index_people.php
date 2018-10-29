<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PeopleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Люди';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="people-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Регистрация', ['create_people'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

           // 'idHuman',
            'Name',
            'Family',
           // 'idOrganization',
           // 'Humandeleted',
            'patronymic',
            ['class' => 'yii\grid\ActionColumn',
	            'headerOptions' => ['width' => '120'],
	            'template' => '{update} {delete}',
	            //Замыкание в анонимной функции PHP- я нихера не понял как это работает  -(((
	            'buttons' => [
	                'delete' => function ($url,$model){  
						$url = Url::to(['dictionary/delete_people', 'id' =>$model->idHuman]);
	                    return Html::a(
	                    '<span class="glyphicon glyphicon-trash"></span>', 
	                    $url,['title' => 'Удалить']);
	                },
	                'update' => function ($url,$model){  
						$url = Url::to(['dictionary/update_people', 'id' =>$model->idHuman]);
	                    return Html::a(
	                    '<span class="glyphicon glyphicon-pencil"></span>', 
	                    $url,['title' => 'Изменить']);
	                },
	            ],
            ],
            
        ],
    ]); ?>
</div>
