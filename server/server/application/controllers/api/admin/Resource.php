<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
class Resource extends REST_Controller {
  protected $_resourice =  array(
    'templates' => 'admin/Resource_templates_model',
    'resourcies' => 'admin/Resourcies_model'
  );

  function __construct()
  {
    parent::__construct();
    //$this->output->enable_profiler(TRUE);
    $this->load->database();
    
    $this->load->model('admin/Auth_model','auth');
    //$token = $this->input->get_request_header('authorization', TRUE);
    $token = 'zyy';
    if($this->auth->run($token) === false)
    {
      $this->response('',401);
    }
  }

  public function _remap($resource, $params = array())  
  { 
    if(!isset($this->_resourice[$resource]))
    {
      $this->response([
          $this->config->item('rest_status_field_name') => FALSE,
          $this->config->item('rest_message_field_name') => $this->lang->line('text_rest_unknown_method')
      ], 405);
    }
    $this->load->model($this->_resourice[$resource],'resourcies');
    $this->{'rest_'.$this->input->method()}();
  }

  public function rest_get()
  { 
    $key = $this->get('id');
    $field = $this->auth->Getter('field');
    if(isset($key))
    { 
      if($field !== '*')
      {
        $field = $this->resourcies->field_intersect($field,$this->resourcies->Getter('get_field'));
        $this->resourcies->Setter('get_field',$field);
      }
      $this->response($this->resourcies->get($key), 200);
    }
    if($field !== '*')
    {
      $field = $this->resourcies->field_intersect($field,$this->resourcies->Getter('query_field'));
      $this->resourcies->Setter('query_field',$field);
    }
    $this->response($this->resourcies->query($this->get()), 200);
  }

  public function rest_post()
  { 
    $result = $this->resourcies->create($this->post());
    $result['status'] || $this->response($result['errors'],400);
    $this->response('',201);
  }

  public function rest_put()
  {
    $field = $this->auth->Getter('field');
    if($field !== '*')
    {
      $field = $this->resourcies->field_intersect($field,$this->resourcies->Getter('update_field'));
      $this->resourcies->Setter('update_field',$field);
    }
    $result = $this->resourcies->update($this->put());
    $result['status'] || $this->response($result['errors'],400);
    $this->response('',204);
  }

  public function rest_delete()
  {
    $this->resourcies->remove($this->delete('id'));
    $this->response('',204);
  }
}

