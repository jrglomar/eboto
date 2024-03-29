<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Userrole extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$this->load->view('admin/userrole');
    }
    
    public function add_user()
	{
		$this->load->helper('string');
		// loading model that needed
		$this->load->model('database_model');
		$userFirstName = $this->input->post('userFirstName');
		$userMiddleName = $this->input->post('userMiddleName');
		$userLastName = $this->input->post('userLastName');
		$userStudentNo = $this->input->post('userStudentNo');
		$userEmail = $this->input->post('userEmail');
		$userCourse = $this->input->post('userCourse');
		$userType = $this->input->post('userType');

		$userPassword = random_string('alnum', 8);

		$insert_data = array(
			'userFirstName' => $userFirstName,
			'userMiddleName' => $userMiddleName,
			'userLastName' => $userLastName,
			'userStudentNo' => $userStudentNo,
			'userEmail' => $userEmail,
			'userCourse' => $userCourse,
			'userType' => $userType,
			'userPassword' => $userPassword
			);

		$this->database_model->create($insert_data, "t_user");
		
		$data = $this->database_model->view_user('userStatus', 't_user');
		foreach($data as $row){
			if($row->userCourse == 'BSIT'){
				$data = $this->database_model->get_org_id('COMMITS');
				$orgId = $data[0]->id;
				$data = array(
					'userOrg' => $orgId
				);
				$this->database_model->updateOrg($row->id, $data);
			}
			else if($row->userCourse == 'BSBA MM'){
				$data = $this->database_model->get_org_id('JMS');
				$orgId = $data[0]->id;
				$data = array(
					'userOrg' => $orgId
				);
				$this->database_model->updateOrg($row->id, $data);
			}
			else if($row->userCourse == 'BBTE'){
				$data = $this->database_model->get_org_id('FBTO');
				$orgId = $data[0]->id;
				$data = array(
					'userOrg' => $orgId
				);
				$this->database_model->updateOrg($row->id, $data);
			}
			else if($row->userCourse == 'BSENT'){
				$data = $this->database_model->get_org_id('YES');
				$orgId = $data[0]->id;
				$data = array(
					'userOrg' => $orgId
				);
				$this->database_model->updateOrg($row->id, $data);
			}
			else if($row->userCourse == 'BSBA HRM'){
				$data = $this->database_model->get_org_id('CHRS');
				$orgId = $data[0]->id;
				$data = array(
					'userOrg' => $orgId
				);
				$this->database_model->updateOrg($row->id, $data);
			}
			else if($row->userCourse == 'DOMT'){
				$data = $this->database_model->get_org_id('DOMT');
				$orgId = $data[0]->id;
				$data = array(
					'userOrg' => $orgId
				);
				$this->database_model->updateOrg($row->id, $data);
			}
		}
	}

	public function show_user()
	{
		$this->load->model('database_model');
		
		$data["data"] = $this->database_model->view_user('userStatus', "t_user");

		echo json_encode($data);


	}
	
	
	public function delete_user()
	{
		// loading model that needed
		$this->load->model('database_model');

		$id = $this->input->get('id');
		$this->database_model->delete($id, "userStatus", "t_user");
	}

	public function activate_user()
	{
		// loading model that needed
		$this->load->model('database_model');


		$id = $this->input->get('id');
		$this->database_model->activate($id, "userStatus", "t_user");
	}

	public function get_user($id)
	{
		$this->load->model('database_model');

		$data = $this->database_model->get($id, 't_user');

		echo json_encode($data);
	}

	public function update_user()
	{
		// loading model that needed
		$this->load->model('database_model');

		// getting data from input
		$id = $this->input->post('id');
		$userFirstName = $this->input->post('edituserFirstName');
		$userMiddleName = $this->input->post('edituserMiddleName');
		$userLastName = $this->input->post('edituserLastName');
		$userStudentNo = $this->input->post('edituserStudentNo');
		$userEmail = $this->input->post('edituserEmail');
		$userCourse = $this->input->post('edituserCourse');
		$userType = $this->input->post('edituserType');
		

		$insert_data = array(
			'userFirstName' => $userFirstName,
			'userMiddleName' => $userMiddleName,
			'userLastName' => $userLastName,
			'userStudentNo' => $userStudentNo,
			'userEmail' => $userEmail,
			'userCourse' => $userCourse,
			'userType' => $userType,
		);
		
		print_r($insert_data);
		$this->database_model->update($id, $insert_data, "t_user");

	}

	
	public function import(){

		if(isset($_FILES["excelFile"]["name"]))
		{
			$config['upload_path'] = './resources/files';
			$config['allowed_types'] = 'xlsx';
			
			$this->load->library('upload', $config);
			
			if(!$this->upload->do_upload('excelFile'))
			{
				echo $this->upload->display_errors();
			}
			else
			{
				$fileInfo = $this->upload->data();
				$file = 'resources/files/'.$fileInfo['file_name'];
				$this->load->library('excel');
				$objPHPExcel = PHPExcel_IOFactory::load($file);
				$cell_collection = $objPHPExcel->getActiveSheet()->getCellCollection();

				foreach ($cell_collection as $cell) {
					$column = $objPHPExcel->getActiveSheet()->getCell($cell)->getColumn();
					$row = $objPHPExcel->getActiveSheet()->getCell($cell)->getRow();
					$data_value = $objPHPExcel->getActiveSheet()->getCell($cell)->getValue();
				 
					//The header will/should be in row 1 only. of course, this can be modified to suit your need.
					if ($row == 1) {
						$header[$row][$column] = $data_value;
					} else {
						$arr_data[$row][$column] = $data_value;
					}
				}
				 
				//send the data in an array format
				$data['header'] = $header;
				$userDetails['values'] = $arr_data;
			}

			echo "<pre>";
			print_r($data['header']);
			print_r($userDetails['values']);
			echo "</pre>";

			foreach($userDetails['values'] as $row){
				$insert_data = array(
					'userFirstName' => $row['A'],
					'userMiddleName' => $row['B'],
					'userLastName' => $row['C'],
					'userStudentNo' => $row['D'],
					'userEmail' => $row['E'],
					'userCourse' => $row['F'],
				);
				
				$this->database_model->create($insert_data, "t_user");
			}

		$data = $this->database_model->view_user('userStatus', 't_user');
		foreach($data as $row){
			if($row->userCourse == 'BSIT'){
				$data = $this->database_model->get_org_id('COMMITS');
				$orgId = $data[0]->id;
				$data = array(
					'userOrg' => $orgId
				);
				$this->database_model->updateOrg($row->id, $data);
			}
			else if($row->userCourse == 'BSBA MM'){
				$data = $this->database_model->get_org_id('JMS');
				$orgId = $data[0]->id;
				$data = array(
					'userOrg' => $orgId
				);
				$this->database_model->updateOrg($row->id, $data);
			}
			else if($row->userCourse == 'BBTE'){
				$data = $this->database_model->get_org_id('FBTO');
				$orgId = $data[0]->id;
				$data = array(
					'userOrg' => $orgId
				);
				$this->database_model->updateOrg($row->id, $data);
			}
			else if($row->userCourse == 'BSENT'){
				$data = $this->database_model->get_org_id('YES');
				$orgId = $data[0]->id;
				$data = array(
					'userOrg' => $orgId
				);
				$this->database_model->updateOrg($row->id, $data);
			}
			else if($row->userCourse == 'BSBA HRM'){
				$data = $this->database_model->get_org_id('CHRS');
				$orgId = $data[0]->id;
				$data = array(
					'userOrg' => $orgId
				);
				$this->database_model->updateOrg($row->id, $data);
			}
			else if($row->userCourse == 'DOMT'){
				$data = $this->database_model->get_org_id('DOMT');
				$orgId = $data[0]->id;
				$data = array(
					'userOrg' => $orgId
				);
				$this->database_model->updateOrg($row->id, $data);
			}
		}
		}

	}

}

