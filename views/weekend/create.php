<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Weekends */

$this->title = 'Create Weekends';
$this->params['breadcrumbs'][] = ['label' => 'Weekends', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="weekends-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
