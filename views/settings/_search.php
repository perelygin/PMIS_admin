<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\vw_settings_search */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="vw-settings-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_param') ?>

    <?= $form->field($model, 'Prm_name') ?>

    <?= $form->field($model, 'Prm_description') ?>

    <?= $form->field($model, 'Prm_enum_id') ?>

    <?= $form->field($model, 'enm_num_value') ?>

    <?php // echo $form->field($model, 'enm_str_value') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
