<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\TestModel;
use app\models\ContactForm;

class PmisController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionTest1()
    {
		$model = new TestModel();
		
		if ($model->load(Yii::$app->request->post())){
			Yii::$app->session->addFlash('info','Username is: '.$model->username);
			$auth = Yii::$app->authManager;
            $auth->removeAll(); //На всякий случай удаляем старые данные из БД...
            // Создадим роли админа и редактора новостей
			$admin = $auth->createRole('admin');
			$projectmanager = $auth->createRole('projectmanager');
			// запишем их в БД
			$auth->add($admin);
			$auth->add($projectmanager);
			// Создаем разрешения. Например, просмотр админки viewAdminPage и редактирование новости updateNews
	        $viewAdminPage = $auth->createPermission('viewAdminPage');
	        $viewAdminPage->description = 'Просмотр админки';
	        
	        $BR_list_view = $auth->createPermission('BR_list_view');
	        $BR_list_view->description = 'Просмотр перечня BR';
	        
	        // Запишем эти разрешения в БД
	        $auth->add($viewAdminPage);
	        $auth->add($BR_list_view);
			
			// Роли «Менеджер проектов» присваиваем разрешение «Просмотр перечня BR»
			$auth->addChild($projectmanager,$BR_list_view);
			// админ наследует роль редактора новостей. Он же админ, должен уметь всё! :D
			$auth->addChild($admin, $projectmanager);
			// Еще админ имеет собственное разрешение - «Просмотр админки»
			$auth->addChild($admin, $viewAdminPage);
			
			return $this->refresh();
		}
		$model->username = 'Timur';
        return $this->render('test1',['model' => $model,]);
    }

 }
