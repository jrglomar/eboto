<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

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
		$this->load->model('reports_model');
		
		$data['user_count'] = $this->reports_model->get_user_count();
		$data['org_count'] = $this->reports_model->get_org_count();
		
		$data['election_count'] = $this->reports_model->get_election_count();
		$data['contest_count'] = $this->reports_model->get_contest_count();
		$data['poll_count'] = $this->reports_model->get_poll_count();

		$data['active_election_count'] = $this->reports_model->get_active_election_count();
		$data['active_contest_count'] = $this->reports_model->get_active_contest_count();
		$data['active_poll_count'] = $this->reports_model->get_active_poll_count();

		$data['candidate_count'] = $this->reports_model->get_candidate_count();
		$data['contestant_count'] = $this->reports_model->get_contestant_count();
		$data['option_count'] = $this->reports_model->get_option_count();

		$this->load->view('admin/dashboard', $data);
    }
	
	public function get_chart_percent(){
		$this->load->model('reports_model');

		$data['election_count'] = $this->reports_model->get_election_count();
		$data['contest_count'] = $this->reports_model->get_contest_count();
		$data['poll_count'] = $this->reports_model->get_poll_count();

		$data['sum'] = ($data['election_count'][0]->election_count + $data['contest_count'][0]->contest_count + $data['poll_count'][0]->poll_count);  


		echo json_encode($data);
	}
	
	public function get_month_count(){
		$this->load->model('reports_model');

		$data['election_month'] = $this->reports_model->election_month_count();
		$data['contest_month'] = $this->reports_model->contest_month_count();
		$data['poll_month'] = $this->reports_model->poll_month_count();

		echo json_encode($data);
	}
	
	public function get_user_month_count(){
		$this->load->model('reports_model');

		$data['user_month'] = $this->reports_model->user_month_count();

		echo json_encode($data);
	}

}
