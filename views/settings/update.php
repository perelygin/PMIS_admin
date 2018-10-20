<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\vw_settings */

$this->title = 'Update Vw Settings: ' . $model->id_param;
$this->params['breadcrumbs'][] = ['label' => 'Vw Settings', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_param, 'url' => ['view', 'id' => $model->id_param]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="vw-settings-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
