<?php
namespace app\models;

use Yii;
use yii\base\Model;

class TestModel extends Model
{
    public $username;
    public $password;

    public function rules()
    {
        return [
            // тут определяются правила валидации
            ['username', 'required'],
            ['password', 'safe'],
          
        ];
    }
    public function attributeLabels()
    {
        return [
            'username' => 'Имя пользователя',
        ];
    }
}
