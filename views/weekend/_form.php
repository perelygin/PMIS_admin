<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Weekends */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="weekends-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'weekend')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
