<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Organization;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model app\models\People */
/* @var $form yii\widgets\ActiveForm */

$org = Organization::find()->where(['deleted' => 0])->all();
		$items = ArrayHelper::map($org,'idOrganization','ShortName');
		$params = [
			'prompt' => 'Выберите значение параметра'
		];
		
?>

<div class="people-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'Name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Family')->textInput(['maxlength' => true]) ?>
    
    <?= $form->field($model, 'patronymic')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'idOrganization')->dropDownList($items,$params); ?>

    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
