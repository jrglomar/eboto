<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reports_model extends CI_Model {

    function get_all_election_votes(){
        $query = $this->db->query("SELECT * FROM ALL_ELECTION_VOTES");
        // $this->db->select("t_vote_candidate.id
        //                 , electionName
        //                 , candidateName 
        //                 , (userFirstName+' '+userLastName+' ') AS voterName
        //                 , userStudentNo
        //                 , userCourse
        //                 , FORMAT(voteDateCreated, 'MMM dd, yyyy - hh:mm tt') as voteDateCreated");
        // $this->db->from('t_vote_candidate');
        // $this->db->join('t_election', 't_election.id = t_vote_candidate.vote_electionID', 'left');
        // $this->db->join('t_user', 't_user.id = t_vote_candidate.vote_userID', 'left');
        // $this->db->join('t_candidate', 't_candidate.id = t_vote_candidate.vote_candidateID', 'left');
        // $this->db->order_by('voteDateCreated', 'DESC');
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_all_contest_votes(){
        $query = $this->db->query("SELECT * FROM ALL_CONTEST_VOTES");
        // $this->db->select("ts_vote_contestant.id
        //                 , contestName
        //                 , contestantName 
        //                 , (userFirstName+' '+userLastName+' ') AS voterName
        //                 , userStudentNo
        //                 , userCourse
        //                 , FORMAT(voteDateCreated, 'MMM dd, yyyy - hh:mm tt') as voteDateCreated");
        // $this->db->from('t_vote_contestant');
        // $this->db->join('t_contest', 't_contest.id = t_vote_contestant.vote_contestID', 'left');
        // $this->db->join('t_user', 't_user.id = t_vote_contestant.vote_userID', 'left');
        // $this->db->join('t_contestant', 't_contestant.id = t_vote_contestant.vote_contestantID', 'left');
        // $this->db->order_by('voteDateCreated');
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_all_poll_votes(){
        $query = $this->db->query("SELECT * FROM ALL_POLL_VOTES");
        // $this->db->select("t_vote_option.id
        //                 , pollName
        //                 , optionName 
        //                 , (userFirstName+' '+userLastName+' ') AS voterName
        //                 , userStudentNo
        //                 , userCourse
        //                 , FORMAT(voteDateCreated, 'MMM dd, yyyy - hh:mm tt') as voteDateCreated");
        // $this->db->from('t_vote_option');
        // $this->db->join('t_poll', 't_poll.id = t_vote_option.vote_pollID', 'left');
        // $this->db->join('t_user', 't_user.id = t_vote_option.vote_userID', 'left');
        // $this->db->join('t_option', 't_option.id = t_vote_option.vote_optionID', 'left');
        // $this->db->order_by('voteDateCreated');
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_user_count(){
        $query = $this->db->query("SELECT * FROM GET_USER_COUNT");
        // $this->db->select("COUNT(*) as user_count");
        // $this->db->from("t_user");
        // $this->db->where("userStatus", 1);
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_election_count(){
        $query = $this->db->query("SELECT * FROM GET_ELECTION_COUNT");
        // $this->db->select("COUNT(*) as election_count");
        // $this->db->from("t_election");
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_contest_count(){
        $query = $this->db->query("SELECT * FROM GET_CONTEST_COUNT");
        // $this->db->select("COUNT(*) as contest_count");
        // $this->db->from("t_contest");
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_poll_count(){
        $query = $this->db->query("SELECT * FROM GET_POLL_COUNT");
        // $this->db->select("COUNT(*) as poll_count");
        // $this->db->from("t_poll");
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_active_election_count(){
        $query = $this->db->query("SELECT * FROM GET_ACTIVE_ELECTION_COUNT");
        // $dateToday = mdate("%Y-%m-%d %h:%i:%s");
        
        // $this->db->select("COUNT(*) as active_election_count");
        // $this->db->from("t_election");
        // $this->db->where("electionStatus", 1);
        // $this->db->where("electionDateEnd >=", $dateToday);
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_active_contest_count(){
        $query = $this->db->query("SELECT * FROM GET_ACTIVE_CONTEST_COUNT");
        // $dateToday = mdate("%Y-%m-%d %h:%i:%s");
        
        // $this->db->select("COUNT(*) as active_contest_count");
        // $this->db->from("t_contest");
        // $this->db->where("contestStatus", 1);
        // $this->db->where("contestDateEnd >=", $dateToday);
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_active_poll_count(){
        $query = $this->db->query("SELECT * FROM GET_ACTIVE_POLL_COUNT");
        // $dateToday = mdate("%Y-%m-%d %h:%i:%s");
        
        // $this->db->select("COUNT(*) as active_poll_count");
        // $this->db->from("t_poll");
        // $this->db->where("pollStatus", 1);
        // $this->db->where("pollDateEnd >=", $dateToday);
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    
    function get_candidate_count(){
        $query = $this->db->query("SELECT * FROM GET_CANDIDATE_COUNT");
        // $this->db->select("COUNT(*) as candidate_count");
        // $this->db->from("t_candidate");
        // $this->db->where("candidateStatus", 1);
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_contestant_count(){
        $query = $this->db->query("SELECT * FROM GET_CONTESTANT_COUNT");
        // $this->db->select("COUNT(*) as contestant_count");
        // $this->db->from("t_contestant");
        // $this->db->where("contestantStatus", 1);
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_option_count(){
        $query = $this->db->query("SELECT * FROM GET_OPTION_COUNT");
        // $this->db->select("COUNT(*) as option_count");
        // $this->db->from("t_option");
        // $this->db->where("optionStatus", 1);
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_org_count(){
        $query = $this->db->query("SELECT * FROM GET_ORG_COUNT");
        // $this->db->select("COUNT(*) as org_count");
        // $this->db->from("r_org");
        // $this->db->where("orgStatus", 1);
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function election_month_count(){
        $query = $this->db->query("SELECT * FROM ELECTION_MONTH_COUNT");
        // $this->db->select("MONTH(voteDateCreated) as month, COUNT(*) as count");
        // $this->db->from("t_vote_candidate");
        // $this->db->where('YEAR(voteDateCreated)', date("Y"));
        // $this->db->group_by('MONTH(voteDateCreated)');
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function contest_month_count(){
        $query = $this->db->query("SELECT * FROM CONTEST_MONTH_COUNT");
        // $this->db->select("MONTH(voteDateCreated) as month, COUNT(*) as count");
        // $this->db->from("t_vote_contestant");
        // $this->db->where('YEAR(voteDateCreated)', date("Y"));
        // $this->db->group_by('month(voteDateCreated)');
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function poll_month_count(){
        $query = $this->db->query("SELECT * FROM POLL_MONTH_COUNT");
        // $this->db->select("MONTH(voteDateCreated) as month, COUNT(*) as count");
        // $this->db->from("t_vote_option");
        // $this->db->where('YEAR(voteDateCreated)', date("Y"));
        // $this->db->group_by('month(voteDateCreated)');
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function user_month_count(){
        $query = $this->db->query("SELECT * FROM USER_MONTH_COUNT");
        // $this->db->select("MONTH(userDateCreated) as month, COUNT(*) as count");
        // $this->db->from("t_user");
        // $this->db->where('YEAR(userDateCreated)', date("Y"));
        // $this->db->where('userStatus', 1);
        // $this->db->group_by('MONTH(userDateCreated)');
        // $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_specific_election_votes($id){
        $this->db->select("t_vote_candidate.id
                        , electionName
                        , candidateName 
                        , (userFirstName+' '+userLastName+' ') AS voterName
                        , userStudentNo
                        , userCourse
                        , FORMAT(voteDateCreated, 'MMM dd, yyyy - hh:mm tt') as voteDateCreated");
        $this->db->from('t_vote_candidate');
        $this->db->join('t_election', 't_election.id = t_vote_candidate.vote_electionID', 'left');
        $this->db->join('t_user', 't_user.id = t_vote_candidate.vote_userID', 'left');
        $this->db->join('t_candidate', 't_candidate.id = t_vote_candidate.vote_candidateID', 'left');
        $this->db->where('t_vote_candidate.vote_electionID', $id);
        $this->db->order_by('voteDateCreated');
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_specific_ep_votes($id){
        $this->db->select("t_vote_ep_candidate.id
                        , epName
                        , candidateName 
                        , (userFirstName+' '+userLastName+' ') AS voterName
                        , userStudentNo
                        , userCourse
                        , FORMAT(voteDateCreated, 'MMM dd, yyyy - hh:mm tt') as voteDateCreated");
        $this->db->from('t_vote_ep_candidate');
        $this->db->join('t_ep', 't_ep.id = t_vote_ep_candidate.vote_epID', 'left');
        $this->db->join('t_user', 't_user.id = t_vote_ep_candidate.vote_userID', 'left');
        $this->db->join('t_candidate', 't_candidate.id = t_vote_ep_candidate.vote_candidateID', 'left');
        $this->db->where('t_vote_ep_candidate.vote_epID', $id);
        $this->db->order_by('voteDateCreated');
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_specific_contest_votes($id){
        $this->db->select("t_vote_contestant.id
                        , contestName
                        , contestantName 
                        , (userFirstName+' '+userLastName+' ') AS voterName
                        , userStudentNo
                        , userCourse
                        , FORMAT(voteDateCreated, 'MMM dd, yyyy - hh:mm tt') as voteDateCreated");
        $this->db->from('t_vote_contestant');
        $this->db->join('t_contest', 't_contest.id = t_vote_contestant.vote_contestID', 'left');
        $this->db->join('t_user', 't_user.id = t_vote_contestant.vote_userID', 'left');
        $this->db->join('t_contestant', 't_contestant.id = t_vote_contestant.vote_contestantID', 'left');
        $this->db->where('t_vote_contestant.vote_contestID', $id);
        $this->db->order_by('voteDateCreated');
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }

    function get_specific_poll_votes($id){
        $this->db->select("t_vote_option.id
                        , pollName
                        , optionName 
                        , (userFirstName+' '+userLastName+' ') AS voterName
                        , userStudentNo
                        , userCourse
                        , FORMAT(voteDateCreated, 'MMM dd, yyyy - hh:mm tt') as voteDateCreated");
        $this->db->from('t_vote_option');
        $this->db->join('t_poll', 't_poll.id = t_vote_option.vote_pollID', 'left');
        $this->db->join('t_user', 't_user.id = t_vote_option.vote_userID', 'left');
        $this->db->join('t_option', 't_option.id = t_vote_option.vote_optionID', 'left');
        $this->db->where('t_vote_option.vote_pollID', $id);
        $this->db->order_by('voteDateCreated');
        $query = $this->db->get();
        $data = $query->result();
        return $data;
    }
    

}
