<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Weekends */

$this->title = 'Update Weekends: ' . $model->idWeekends;
$this->params['breadcrumbs'][] = ['label' => 'Weekends', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->idWeekends, 'url' => ['view', 'id' => $model->idWeekends]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="weekends-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
