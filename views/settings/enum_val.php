<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\vw_settings */

$this->title = 'Значения параметра';
$this->params['breadcrumbs'][] = ['label' => 'Параметры системы', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vw-settings-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php $form = ActiveForm::begin([
    //    'action' => ['update','idWorksOfEstimate'=>$model->idWorksOfEstimate,'idBR'=>$idBR,'idWbs'=>$model->idWbs,'idEstimateWorkPackages'=>$model->idEstimateWorkPackages],  
        'method' => 'post',
        'id' =>"frm1"]); 
     ?>
     
    <table border = "1" cellpadding="4" cellspacing="2"> 
 <?php 
   foreach($Enum as $enm){
	   echo('<tr><td>'. 
	   $form->field($enm, 'enm_num_value',
								['inputOptions' => ['name'=>'enm_num_value['.$enm['idEnumSettings'].']']]).'</td><td>'.
	   $form->field($enm, 'enm_str_value',
								['inputOptions' => ['name'=>'enm_str_value['.$enm['idEnumSettings'].']']])
	.'</td></tr>');
	}
 ?>
    </table>

    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success',
											'name'=>'btn',
											'value' => 'save_']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
