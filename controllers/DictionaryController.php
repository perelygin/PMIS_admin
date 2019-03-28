<?php

namespace app\controllers;

use Yii;
use app\models\People;
use app\models\PeopleSearch;
use app\models\Weekends;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * DictionaryController implements the CRUD actions for People model.
 */
class DictionaryController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all People models.
     * @return mixed
     */
    public function actionIndex_people()
    {
        $searchModel = new PeopleSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index_people', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single People model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    //public function actionView_people($id)
    //{
        //return $this->render('view', [
            //'model' => $this->findModel_people($id),
        //]);
    //}

    /**
     * Creates a new People model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate_people()
    {
        $model = new People();
        $model->Family = 'Новиков';
        $model->Name = 'Новый';
        if ($model->save()) {
            return $this->redirect(['update_people', 'id' => $model->idHuman]);
        } else{
			if($model->hasErrors()){
					//Yii::$root->session->addFlash('error',"Ошибка сохранения по шаблону WBS. корневой узел ");
					echo('<pre> '.print_r($model->errors).'</pre>'); die;
				}
			}
    }

    /**
     * Updates an existing People model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate_people($id)
    {
        $model = $this->findModel_people($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index_people']);
        }

        return $this->render('update_people', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing People model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete_people($id)
    {
        $model = People::findOne($id);
        $model->Humandeleted = 1;
        $model->save();
        

        return $this->redirect(['index_people']);
    }

    /**
     * Finds the People model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return People the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel_people($id)
    {
        if (($model = People::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
  
}
