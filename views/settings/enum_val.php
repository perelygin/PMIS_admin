<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\vw_settings */

$this->title = 'Значения параметра '.$model->Prm_name;
$this->params['breadcrumbs'][] = ['label' => 'Параметры системы', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vw-settings-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php 
        $form = ActiveForm::begin();
      ?>
 <div class="container">
     
    <table border = "1" cellpadding="4" cellspacing="2"> 
 <?php 
   
   foreach($Enum as $enm){
	   echo('<tr><td>'. 
	   $form->field($enm, 'enm_num_value',
							['inputOptions' => ['id'=> 'enm_num_value'.$enm['idEnumSettings'],
							'name'=>'enm_num_value['.$enm['idEnumSettings'].']']]).'</td><td>'.
	   $form->field($enm, 'enm_str_value',
								['inputOptions' => ['name'=>'enm_str_value['.$enm['idEnumSettings'].']']])
	.'</td></tr>');
	}

 ?>
    </table>
  
</div> 
    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success',
											'name'=>'btn',
											'value' => 'save_']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
