<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $model app\models\Weekends */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="weekends-form">

    <?php $form = ActiveForm::begin(); ?>
 <div class="container">
	   <div class="row">
		  <div class="col-sm-4">
			 <?php
				echo $form->field($model, 'DateBegin')->widget(DatePicker::className(),[
				    'pluginOptions' => [
				        'autoclose'=>true,
				        'format' => 'yyyy-mm-dd',
				         'todayHighlight' => true
				    ]
				]); 
			?> 
		  </div>
		  <div class="col-sm-4">
			 <?php
				echo $form->field($model, 'DateEnd')->widget(DatePicker::className(),[
				    'pluginOptions' => [
				        'autoclose'=>true,
				        'format' => 'yyyy-mm-dd',
				         'todayHighlight' => true
				    ]
				]); 
			?> 
		  </div>
	   </div>	  
</div>
    

    <div class="form-group">
        <?= Html::submitButton('Генерировать', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
