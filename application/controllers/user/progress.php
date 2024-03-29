<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Progress extends CI_Controller {

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
        $this->load->model('database_model');
        $this->load->helper('date');

        $refTableID = $this->uri->segment(4);
        $tableName = $this->uri->segment(5);

        $data['tableName'] = $tableName;

        if($tableName == 't_candidate'){
            $data['data'] = $this->database_model->get_candidate_votes($refTableID, 'candidateElectionID'
                                                            , "t_candidate", "t_vote_candidate"
                                                            , "vote_candidateID", "candidateName");
        }

        if($tableName == 't_ep'){
            $data['data'] = $this->database_model->get_candidate_votes($refTableID, 'candidateEpID'
                                                            , "t_candidate", "t_vote_ep_candidate"
                                                            , "vote_candidateID", "candidateName");
        }

        else if($tableName == 't_contestant'){
            $data['data'] = $this->database_model->get_votes($refTableID, 'contestantContestID'
                                                            , "t_contestant", "t_vote_contestant"
                                                            , "vote_contestantID", "contestantName");
        }
        else if($tableName == 't_option'){
            $data['data'] = $this->database_model->get_votes($refTableID, 'optionPollID'
                                                            , "t_option", "t_vote_option"
                                                            , "vote_optionID", "optionName");
        }

        // Ref Table Info
        if($tableName == 't_candidate'){
            $refTableName = 't_election';
        }
        if($tableName == 't_ep'){
            $refTableName = 't_ep';
        }
        else if($tableName == 't_contestant'){
            $refTableName = 't_contest';
        }
        else if($tableName == 't_option'){
            $refTableName = 't_poll';
        }

        $data['refInfo'] = $this->database_model->get($refTableID, $refTableName);

		$this->load->view('user/progress', $data);
    }
	
    function get_votes($tableName, $refTableID){

        if($tableName == 't_candidate'){
            $data['data'] = $this->database_model->get_candidate_votes($refTableID, 'candidateElectionID'
                                                            , "t_candidate", "t_vote_candidate"
                                                            , "vote_candidateID", "candidateName");
        }

        if($tableName == 't_ep'){
            $data['data'] = $this->database_model->get_candidate_votes($refTableID, 'candidateEpID'
                                                            , "t_candidate", "t_vote_ep_candidate"
                                                            , "vote_candidateID", "candidateName");
        }

        else if($tableName == 't_contestant'){
            $data['data'] = $this->database_model->get_votes($refTableID, 'contestantContestID'
                                                            , "t_contestant", "t_vote_contestant"
                                                            , "vote_contestantID", "contestantName");
        }
        else if($tableName == 't_option'){
            $data['data'] = $this->database_model->get_votes($refTableID, 'optionPollID'
                                                            , "t_option", "t_vote_option"
                                                            , "vote_optionID", "optionName");
        }
       
        echo json_encode($data);
    }
	

}
