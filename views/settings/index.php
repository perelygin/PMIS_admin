<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;


/* @var $this yii\web\View */
/* @var $searchModel app\models\vw_settings_search */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Параметры системы';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vw-settings-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Vw Settings', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

           // 'id_param',
            'Prm_name',
           // 'Prm_description',
            //'Prm_enum_id',
            'enm_num_value',
            'enm_str_value',

            ['class' => 'yii\grid\ActionColumn',
	            'headerOptions' => ['width' => '120'],
	            'template' => '{update} {delete} {enum_val}',
	            //Замыкание в анонимной функции PHP- я нихера не понял как это работает  -(((
	            'buttons' => [
	                'delete' => function ($url,$model){  
						$url = Url::to(['settings/delete', 'id' =>$model->id_param]);
	                    return Html::a(
	                    '<span class="glyphicon glyphicon-trash"></span>', 
	                    $url,['title' => 'Удалить параметр']);
	                },
	                'update' => function ($url,$model){  
						$url = Url::to(['settings/update', 'id' =>$model->id_param]);
	                    return Html::a(
	                    '<span class="glyphicon glyphicon-pencil"></span>', 
	                    $url,['title' => 'Изменить параметр']);
	                },
	                'enum_val' => function ($url,$model){  
						$url = Url::to(['settings/enum_value', 'id' =>$model->id_param ]);
	                    return Html::a(
	                    '<span class="glyphicon glyphicon-th"></span>', 
	                    $url,['title' => 'Значения параметра']);
	                },
	            ],
            ],
        ],
    ]); ?>
</div>
