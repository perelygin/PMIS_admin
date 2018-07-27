
<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
$this->title = 'About';
$this->params['breadcrumbs'][] = $this->title;

$form = ActiveForm::begin([
    'id' => 'contact-form',
    'options' => ['class' => 'form-horizontal'],
]) ?>
    <?= $form->field($model, 'username') ?>
    <?= $form->field($model, 'password') ?>

 <div class="form-group">
                        <?= Html::submitButton('Submit', ['class' => 'btn btn-primary', 'name' => 'contact-button1']) ?>
                    </div>
 <div class="form-group">
                        <?= Html::submitButton('Submit', ['class' => 'btn btn-primary', 'name' => 'contact-button2']) ?>
 </div>
<?php ActiveForm::end() ?>


