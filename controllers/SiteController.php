<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\SignupForm;
use app\models\User;
use app\models\RbacForm;


class SiteController extends Controller
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
                    [
	                    'allow' => true,
	                    'actions' => ['rbac'],
	                    'roles' => ['ManageUserRole'],
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
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }

        $model->password = '';
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');
            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }
    
    //личный кабинет
	public function actionRbac(){
	  if (!Yii::$app->user->can('ManageUserRole')){
		  Yii::$app->session->addFlash('error',"У вас нет прав на использование этого функционала");
			return $this->goHome();
		  }
		$model = new RbacForm();
		if($model->load(\Yii::$app->request->post()) && $model->validate()){
			$auth = Yii::$app->authManager;
			$auth->removeAll(); //На всякий случай удаляем старые данные из БД...
        
	        // Создадим роли админа и прочих
	        $admin = $auth->createRole('admin');
	        $pm = $auth->createRole('projectmanager');
	        $analyst = $auth->createRole('analyst');
			$technologist = $auth->createRole('technologist');
	        
	        
	        // запишем их в БД
	        $auth->add($admin);
	        $auth->add($pm);
	        $auth->add($analyst);
	        $auth->add($technologist);
	        
	        // Создаем разрешения. Например, просмотр админки viewAdminPage и редактирование новости updateNews
			$UserRoleManagementPage = $auth->createPermission('ManageUserRole');
			$UserRoleManagementPage->description = 'Управление ролями';
			
			//Просмотр журнала BR
			$BRJournalView = $auth->createPermission('BRJournalView');
			$BRJournalView->description = 'Просмотр журнала BR';
			 
			// Запишем эти разрешения в БД
			$auth->add($UserRoleManagementPage);
			$auth->add($BRJournalView); 
			 
			// Теперь добавим наследования. Для роли technologist мы добавим разрешение BRJournalView,
			// а для админа добавим наследование от роли technologist и еще добавим собственное разрешение technologist
        
        // Роли «Редактор новостей» присваиваем разрешение «Редактирование новости»
        $auth->addChild($technologist,$BRJournalView);

        // админ наследует роль редактора новостей. Он же админ, должен уметь всё! :D
        $auth->addChild($admin, $technologist);
        
        // Еще админ имеет собственное разрешение - «Просмотр админки»
        $auth->addChild($admin, $UserRoleManagementPage);
        
        
        
         // Назначаем роль admin пользователю с ID 1
        $auth->assign($admin, 4); 
        
        // Назначаем роль editor пользователю с ID 2
        //$auth->assign($editor, 2);
			 
		}
		return $this->render('RbacForm', compact('model'));
	
	}
	
    //регистрация пользователя
    public function actionSignup(){
	 if (!Yii::$app->user->isGuest) {
		return $this->goHome();
	 }
	 $model = new SignupForm();
	 if($model->load(\Yii::$app->request->post()) && $model->validate()){
		 $user = new User();
		 $user->username = $model->username;
		 $user->email = $model->email;
		 $user->setPassword($model->password);
		 $user->generateAuthKey();
		 
		 
		 if($user->save()){
					
			return $this->goHome();
		 } 
		 else{
			 if($user->hasErrors()){
				$ErrorsArray = $user->getErrors(); 	 
				foreach ($ErrorsArray as $key => $value1){
					foreach($value1 as $value2){
						if($key == 'username'){
							$model->addError($key, $value2);
						} else {
							Yii::$app->session->addFlash('error',"Ошибка сохранения. Реквизит ".$key." ".$value2);
						}
					}
				}	
				//echo '<pre>'; print_r($ErrorsArray); die;
			 }
			 
			 
			 
		 }
	  }
	 return $this->render('signup', compact('model'));
	}
	
	
    
}
