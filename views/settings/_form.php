<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\EnumSettings;
use yii\helpers\ArrayHelper;


/* @var $this yii\web\View */
/* @var $model app\models\vw_settings */
/* @var $form yii\widgets\ActiveForm */

		$Enum = EnumSettings::find()->where(['id_param' => $model->id_param])->all();
		foreach($Enum as &$value){
			$value['enm_num_value'] = $value['enm_num_value'].' - '.$value['enm_str_value'];
		}
		$items = ArrayHelper::map($Enum,'idEnumSettings','enm_num_value');
		$params = [
			'prompt' => 'Выберите значение параметра'
		];
?>

<div class="vw-settings-form">

    <?php $form = ActiveForm::begin(); ?>
	<div class="container">
	   <div class="row">
		  <div class="col-sm-6">
				 <?= $form->field($model, 'Prm_name')->textInput(['maxlength' => true]) ?>
	      </div>
	      <div class="col-sm-6">
				<?= $form->field($model, 'Prm_enum_id')->dropDownList($items,$params); ?>
		  </div>
	   </div>
	   <div class="row">
		    <div class="col-sm-12">
				 <?= $form->field($model, 'Prm_description')->textInput(['maxlength' => true]) ?>
			</div>
	   </div>
    </div>

   

   

    

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
