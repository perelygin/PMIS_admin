<?php

namespace app\controllers;

use Yii;
use app\models\Weekends;
use app\models\WeekendSearch;
use app\models\weekend_generator;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * WeekendController implements the CRUD actions for Weekends model.
 */
class WeekendController extends Controller
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
     * Lists all Weekends models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new WeekendSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Weekends model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Weekends model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Weekends();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->idWeekends]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }
  public function actionGenerate()
    {
        $model =  new  Weekend_generator();
        if ($model->load(Yii::$app->request->post())) {
            $dbeg = \DateTime::createFromFormat('Y-m-d', $model->DateBegin);
            $dend = \DateTime::createFromFormat('Y-m-d', $model->DateEnd);
            //проверка корректности интервала
            $interval = $dbeg->diff($dend);
					if($interval->invert == 1){
						Yii::$app->session->addFlash('error',"Дата окончания не может быть меньше даты начала");
	 				    }
	 	    //удаление выходных за выбранный интервал
	 	    Yii::$app->db->createCommand()->delete('Weekends',['and', ['>=','Weekends.weekend',$model->DateBegin],['<=','Weekends.weekend',$model->DateEnd]])->execute(); 
	 	    //перебираем по одному дню в заданом интервале и определяем его номер в неделе. 0 и 1 - выходные
	 	    while($dbeg != $dend){
				$t = new \DateInterval('P1D');
				$dbeg->add($t);  	
				$nday = $dbeg->format('w');
				if($nday==6 or $nday==0){  //0-воскресенье, 6 - суббота
					$wk = new Weekends();	
					$wk->weekend = $dbeg->format('Y-m-d');
					$wk->save();
					//echo $dbeg->format('Y-m-d')."    ".$dbeg->format('w')."<br>";
				}
			}
  
			return $this->redirect(['index']);	
        }
        return $this->render('Weekend_generator', [
            'model' => $model,
        ]);
    }
    /**
     * Updates an existing Weekends model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->idWeekends]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Weekends model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Weekends model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Weekends the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Weekends::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
