<?php

namespace app\controllers;

use Yii;
use app\models\vw_settings;
use app\models\vw_settings_search;
use app\models\EnumSettings;
use app\models\Settings;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

use app\models\VwListOfWorkEffort;

/**
 * SettingsController implements the CRUD actions for vw_settings model.
 */
class SettingsController extends Controller
{
    /**
     * {@inheritdoc}
     */
    //public function behaviors()
    //{
        //return [
            //'verbs' => [
                //'class' => VerbFilter::className(),
                //'actions' => [
                    //'delete' => ['POST'],
                //],
            //],
        //];
    //}

    /**
     * Lists all vw_settings models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new vw_settings_search();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


   public function actionEnum_value($id)
    {
      $Enum = EnumSettings::find()->where(['id_param' => $id])->all();  
      $model = Settings::find()->where(['id_param' => $id])->one(); 
       
       $VwListOfWorkEffort = VwListOfWorkEffort::find()->where([
			'idEstimateWorkPackages'=>1, 
			'idWbs'=>60,
			'idWorksOfEstimate'=>21])->orderBy('idLaborExpenditures')->all();
        
        //if(isset($a['enm_num_value']) or isset($a['enm_str_value'])){
		//	echo('dddd');die;
	//	}
        
         if ($model->load(Yii::$app->request->post()) && $model->save()) {
			 echo('kkkk');die;
		 } 
      return $this->render('enum_val', [
            'model' => $model,
            'Enum' => $Enum,
            'VwListOfWorkEffort'=>$VwListOfWorkEffort
      ]);
      
    }

    /**
     * Displays a single vw_settings model.
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
     * Creates a new vw_settings model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $Settings = new Settings;
        $Settings->Prm_name = 'new param';
        $Settings->Prm_description ='описание парметра';
        if ($Settings->save()) {
            $enum = new EnumSettings;
            $enum->id_param = $Settings->id_param;
            if($enum->save()){
				$Settings->Prm_enum_id = $enum->idEnumSettings;
				$Settings->save();
			}
        }
		return $this->redirect(['update', 'id' => $Settings->id_param]);
		//return $this->redirect(['index']);
    }

    /**
     * Updates an existing vw_settings model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = Settings::findOne($id);


        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            //return $this->redirect(['view', 'id' => $model->id_param]);
            return $this->redirect(['index']);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing vw_settings model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $model = Settings::findOne($id);
        $model->deleted = 1;
        $model->save();

        return $this->redirect(['index']);
    }

    /**
     * Finds the vw_settings model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return vw_settings the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = vw_settings::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
