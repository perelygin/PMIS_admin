<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\People */

$this->title = 'Корректировка данных: ' . $model->Name;
$this->params['breadcrumbs'][] = ['label' => 'Люди', 'url' => ['index_people']];
$this->params['breadcrumbs'][] = $model->Family;
$this->params['breadcrumbs'][] = 'Корректировка данных';
?>
<div class="people-update">

    <h1><?= Html::encode($this->title) ?></h1>
     
    <?= $this->render('_form_people', [
        'model' => $model,
    ]) ?>

</div>
