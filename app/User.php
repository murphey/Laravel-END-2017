<?php namespace App;

use App\MaguttiCms\Permission\GFEntrustUserTrait;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

use App\MaguttiCms\Notifications\UserResetPasswordNotification as UserResetPasswordNotification;
use Illuminate\Support\Facades\Config;
class User extends Authenticatable
{
    use Notifiable;
    use GFEntrustUserTrait; // add this trait to your user model

    protected  $role_user_table  = "role_user";
    protected  $user_foreign_key = "user_id";

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $fieldspec = [];

    /**
     * @param $roles
     */
    public function saveRoles($roles)


    {
        if(!empty($roles))
        {
            $this->roles()->sync($roles);
        } else {
            $this->roles()->detach();
        }

    }

    /**
     * @param $password
     */
    public function setPasswordAttribute($password)
    {
        if($password !=''){
            $this->attributes['password'] = bcrypt($password);
            //  set  also the real password only for  demo purpose must not fillable
            $this->attributes['real_password'] = $password;
        }
    }

    /**
     * @return array
     */
    function getFieldSpec ()
        // set the specifications for this database table
    {

        // build array of field specifications
        $this->fieldspec['id'] = [
            'type'     => 'integer',
            'minvalue' => 0,
            'pkey'     => 'y',
            'required' =>true,
            'label'    => 'id',
            'hidden'   => 1,
            'display'  => 0,
        ];
        $this->fieldspec['name']    = [
            'type'      => 'string',
            'required'  => true,
            'hidden'    => 0,
            'label'     => 'Name',
            'extraMsg'  => '',
            'display'   => 1,
        ];
        $this->fieldspec['email']    = [
            'type'      => 'string',
            'required'  => true,
            'hidden'    => 0,
            'label'     => 'Email',
            'extraMsg'  => '',
            'display'   => 1,
        ];

		$this->fieldspec['role'] = [
			'type'       		=> 'relation',
			'model'      		=> 'Role',
			'relation_name'     => 'roles',
			'foreign_key'=> 'id',
			'label_key'  => 'display_name',
   			'size' => 5,
			'minvalue' => 0,
			'maxvalue' => 65535,
			'pkey' => 'y',
			'required' =>true,
			'label'=>'Role',
			'hidden' => 0,
			'display'=>1,
			 'multiple' => true,
		];

        $this->fieldspec['password']    = [
            'type'      =>'password',
            'required'  => true,
            'hidden'    => 0,
            'label'     => 'Password',
            'extraMsg'  => '',
            'display'   => 1,
            'template'  => 'password' /*TODO*/
        ];
        $this->fieldspec['is_active']   = [
            'type'      => 'boolean',
            'required'  => false,
            'hidden'    => 0,
            'label'     => trans('admin.label.active'),
            'display'   => 1
        ];
        return $this->fieldspec;
    }

    /**
     * create a new  user
     * @param array $data
     * @return mixed
     */
    static  public function   register(array $data) {
        $user = static::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' =>   $data['password'],
        ]);
        event( new UserRegistered($user) );
        return $user;
    }

    /*
    |--------------------------------------------------------------------------
    | NOTIFIABLE OVERRIDE THE SENDPASSWORDRESETNOTIFICATION
    |--------------------------------------------------------------------------
    |
    */

    public function sendPasswordResetNotification($token)
    {
        $this->notify(new UserResetPasswordNotification($token));
    }

	/**
	* This method is used to check whether the user is active or not.
	*
	* @return bool
	*/
	public function isActive()
	{
		return $this->is_active == 1;
	}
}
