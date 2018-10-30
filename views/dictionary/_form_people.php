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
    
    <div class="container">
	   <div class="row">
		  <div class="col-sm-4">
				 <?= $form->field($model, 'Family')->textInput(['maxlength' => true]) ?>
	      </div>
	      <div class="col-sm-4">
				<?= $form->field($model, 'Name')->textInput(['maxlength' => true]) ?>
		  </div>
		   <div class="col-sm-4">
				 <?= $form->field($model, 'patronymic')->textInput(['maxlength' => true])  ?>
		   </div>
	   </div>
	   <div class="row">
		    <div class="col-sm-4">
				 <?= $form->field($model, 'idOrganization')->dropDownList($items,$params); ?>
		   </div>
	   </div>
	   <div class="row">
		  <div class="col-sm-4">
				 <?= $form->field($model, 'phone_number')->textInput(['maxlength' => true]) ?>
	      </div>
	      <div class="col-sm-4">
				<?= $form->field($model, 'internal_phone_number')->textInput(['maxlength' => true]) ?>
		  </div>
		   <div class="col-sm-4">
				 <?= $form->field($model, 'Email')->textInput(['maxlength' => true])  ?>
		   </div>
	   </div>
    </div>


    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
