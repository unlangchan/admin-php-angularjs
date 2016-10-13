<?php  if(!defined('BASEPATH')) exit('No direct script access allowed');

class Auth_model extends CI_Model {  
  
  protected $_user = NULL; 

  public function __construct()
  {  
    parent::__construct();
    $this->load->model('admin/Key_model','token');    
  } 
  
  public function run()
  {
    $token = $this->input->get_request_header('authorization', TRUE);
    if($token && $this->token->key_exists($token))
    {
      $result =  $this->token->get_key($token);
      $this->set_user($result->uid);
      return true;
    }
    return false;
  }
  
  public function get_user($key = NULL)
  {
    if ($key === NULL)
    {
      return $this->_user;
    }
    return isset($this->_user[$key]) ? $this->_user[$key] : NULL;
  }

  public function set_user($key)
  {
    $this->load->driver('cache', array('adapter' => 'apc', 'backup' => 'file'));
    $user = $this->_get_user($key);
    $user['role'] = $this->_get_role($user['role']);
    $this->_user = $user; 
  }

  public function is_pass($ctr,$res,$method)
  {
    $role = $this->get_user('role');
    $rules = $role['resource'];
    if($rules === '*')
    {
      return  '*';
    }
    $rules = json_decode($rules);

    if(isset($rules->$ctr->$res) && !empty(trim($rules->$ctr->$res->fields)) )
    {
      if(in_array($method,$rules->$ctr->$res->method))
      {
        return  $rules->$ctr->$res->fields;
      }
      return false;
    } 
    return false;
  }
  
  protected function _get_role($key)
  {
    // if(!$role = $this->cache->get('resourcies_admin_roles_'.$key))
    // {
      $this->load->model('admin/Admin_role_model','roles');
      $role = $this->roles->get($key,'id,label,router,resource');
      $this->cache->save('resourcies_admin_roles_'.$key,$role,86400);
      return $role;
    // }
    // return $role;
  }

  protected function _get_user($key)
  { 
    // if(!$user = $this->cache->get('resourcies_admin_users_'.$key))
    // {
      $this->load->model('admin/Admin_user_model','users');
      $user = $this->users->get($key,'uid,username,name,role'); 
      // $this->cache->save('resourcies_admin_users_'.$key,$user,86400);
      return $user;
    // }
    // return $user;
  }
}