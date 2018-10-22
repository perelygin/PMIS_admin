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
   <div class="row">
	  <div class="col-sm-6">
		  <p>
	    <?= Html::submitButton('', [
						'span class' => 'glyphicon glyphicon-plus-sign',
						'title'=>'Добавить значение параметра',
						'name'=>'btn',
						'value' => 'add_'])?>
			</p>			
   		<table border = "1" cellpadding="4" cellspacing="2"> 
			 <?php 
			   foreach($Enum as $enm){
				   echo('<tr><td>'. 
				   Html::submitButton('', [
								'span class' => 'glyphicon glyphicon-minus',
								'title'=>'Удалить событие',
								'name'=>'btn',
								'value' => 'del_'.$enm['idEnumSettings']])
					.'</td><td>'.
				   $form->field($enm, 'enm_num_value',
										['inputOptions' => ['id'=> 'enm_num_value'.$enm['idEnumSettings'],
										'name'=>'enm_num_value['.$enm['idEnumSettings'].']']]).'</td><td>'.
				   $form->field($enm, 'enm_str_value',
											['inputOptions' => ['id'=> 'enm_str_value'.$enm['idEnumSettings'],
											'name'=>'enm_str_value['.$enm['idEnumSettings'].']',
											'size'=>70]])
				.'</td></tr>');
				}
			 ?>
		</table>
		<p>
		</div> 
	</div>
	<div class="row">
	  <div class="col-sm-6">	
	    <div class="form-group">
	        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success',
												'name'=>'btn',
												'value' => 'save_']) ?>
	    </div>
	  </div>
	 </div>
   </div>
  </div>
 
    <?php ActiveForm::end(); ?>
   
</div>
