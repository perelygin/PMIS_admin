<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
?>
<p>заполнение таблицы датасета выполняется скриптом по нажатию кнопки</p>
<p>При запуске таблица обнуляется</p>

<?php $form = ActiveForm::begin() ?>
<?= $form->field($model, 'name') ?>
<div class="form-group">
 <div>
 <?= Html::submitButton('Даешь dataset!!!!', ['class' => 'btn btn-success']) ?>
 </div>
</div>
<?php ActiveForm::end() ?>
