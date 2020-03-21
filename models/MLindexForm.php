<?php

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * ContactForm is the model behind the contact form.
 */
class MLindexForm extends Model
{
    public $name;
   
   
    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['name'], 'safe'],
        ];
    }

    /**
     * @return array customized attribute labels
     */
    public function attributeLabels()
    {
        return [
            'name' => 'Имя',
        ];
    }
    
}


