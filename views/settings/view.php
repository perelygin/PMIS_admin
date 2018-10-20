<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\vw_settings */

$this->title = $model->id_param;
$this->params['breadcrumbs'][] = ['label' => 'Vw Settings', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vw-settings-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id_param], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id_param], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_param',
            'Prm_name',
            'Prm_description',
            'Prm_enum_id',
            'enm_num_value',
            'enm_str_value',
        ],
    ]) ?>

</div>
