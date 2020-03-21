<?php

namespace app\controllers;
use Yii;
use app\models\MLindexForm;
use app\models\MLDataset;
use app\models\BusinessRequests;  
use app\models\vw_settings; 
use app\models\User;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use SoapClient;

class MlearnController extends  Controller
{
	public function actionCreate_ds()
    {
	   //Считывание настроек
		$settings = vw_settings::findOne(['Prm_name'=>'Mantis_path_create']);   //путь к wsdl тянем из настроек
						if (!is_null($settings)) $url_mantis_cr = $settings->enm_str_value; //путь к мантиссе
						  else $url_mantis_cr = '';
		$settingsDefaultUser = vw_settings::findOne(['Prm_name'=>'Mantis_default_user']);   //пользователь mantis  по умолчанию
						if (!is_null($settingsDefaultUser)) $mntDefaultUser = $settingsDefaultUser->enm_str_value; //имя пользователя
						  else $mntDefaultUser = 'pmis';
	
	   //wsdl клиент
			$User = User::findOne(['id'=>Yii::$app->user->getId()]); 
			$username = $User->getUserMantisName();
			$password = $User->getMantisPwd();
	   $client = new SoapClient($url_mantis_cr,array('trace'=>1,'exceptions' => 0)); 								  
	   
	   Yii::$app->db->createCommand()->truncateTable('ML_dataset')->execute(); //чистим таблицу
	   $model = 	new MLindexForm();
	   
	   if($model->load(\Yii::$app->request->post()) && $model->validate()){
		   //запрос для выбора всех результатов без подчиненных с типом "Программное обеспечение"
		   $sql1 = "Select 
					  br.BRNumber,
					  br.BRName,
					  wbs.idBr,
					  wbs.id,
					  wbs.name
					from wbs
					LEFT OUTER JOIN BusinessRequests br ON wbs.idBr= br.idBR
					Where (wbs.idResultType = 3) and (wbs.rgt - wbs.lft <= 1)
					order by br.BRNumber";
					
			$sql2 = "SELECT 
						  woe.WorkName,
						  woe.idWorksOfEstimate,
						  woe.idWbs,
						  woe.WorkDescription,
						  woe.mantisNumber,
						 (SELECT sum(workEffort) FROM WorkEffort as wef where wef.idWorksOfEstimate =woe.idWorksOfEstimate) as work_sum
						FROM WorksOfEstimate as woe 
						where woe.idEstimateWorkPackages = :idEWP  and woe.idWbs = :idWBS";
					
		   $all_results = Yii::$app->db->createCommand($sql1)->queryAll(); 				// выбрали все работы по BR
		   if(count($all_results)>0){
			   foreach($all_results as $alr){
				   $BR = BusinessRequests::findOne($alr['idBr']); //нашли BR
				   
				   $all_works = Yii::$app->db->createCommand($sql2)->bindValues([':idEWP'=>$BR->getLastEstimateId(), ':idWBS'=>$alr['id']]   )->queryAll(); //получили все работы из последней оценки по каждому результату		   
				   echo('<br><b>BR-'.$alr['BRNumber'].' '.$alr['BRName'].' </b>'.$alr['name']);
				   foreach($all_works as $wrk){
					   echo('<br>-------'.$wrk['WorkName'].' '.$wrk['mantisNumber'].' <b>'.$wrk['work_sum'].'</b> ');
					   //if(!empty($wrk['mantisNumber'])){  //лезем в мантиссу по номеру инцидента за содержанием работы
							//$issue_id = $wrk['mantisNumber'];
							//$result =  $client->mc_issue_get($username, $password, $issue_id);
							//if (is_soap_fault($result)){   //Ошибка
									    ////Yii::$app->session->addFlash('error',"Ошибка получения информации из mantis SOAP: (faultcode: ".$result->faultcode." faultstring: ".$result->faultstring);
									    //echo("Ошибка получения информации из mantis SOAP: (faultcode: ".$result->faultcode." faultstring: ".$result->faultstring);
									    ////"detail".$result->detail);
									
							//}else{
								////заносим данные в таблицу для датасета   
									//$MLDataset = new MLDataset();
									//$MLDataset->idWorksOfEstimate = $wrk['idWorksOfEstimate'];
									//$MLDataset->BR_number = $alr['BRNumber'];
									//$MLDataset->WorkName = $result->summary;
									//$MLDataset->Analit_name = $BR->get_analit_login();
									//$MLDataset->Work_descr = $result->description;
									//$MLDataset->workEffort = $wrk['work_sum'];
									//$MLDataset->mantisNumber = $wrk['mantisNumber'] ;
									//if($MLDataset->save()){
																	
										
									 //} else{
										 //if($MLDataset->hasErrors()){
											//$ErrorsArray = $MLDataset->getErrors(); 	 
											//foreach ($ErrorsArray as $key => $value1){
												//foreach($value1 as $value2){
													    //echo("Ошибка сохранения. Реквизит ".$key." ".$value2); die;
														////Yii::$app->session->addFlash('error',"Ошибка сохранения. Реквизит ".$key." ".$value2);
												//}
											//}	
										 //}
									//}	
								////echo($result->description); die;
								
								//}
					   
					    //}
					   
					   
					}
			    }
			   die;
			}
		   
		}
       return $this->render('index', [
            'model' => $model
        ]);
    }
}
