<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\vw_settings */

$this->title = 'Create Vw Settings';
$this->params['breadcrumbs'][] = ['label' => 'Vw Settings', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vw-settings-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
