<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\User;
use App\Role;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class RegisterController extends Controller
{
    use RegistersUsers;

     public function showRegistrationForm()
     {
         $role_name = new Role;
         $role_name = $role_name->select('role_name')->get();
        
         return view('auth.register')->with('role_name', $role_name);
     }


    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    public function redirectTo() {
        $role = Auth::user()->role; 
        switch ($role) {
          case 'User':
            return '/user/home';
            break;
          case 'Scrum Master':
            return '/scrum/home';
            break;
          default:
            return '/home'; 
          break;
        }
      }

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'username' =>['required','string','max:20','unique:users'],
            //'district' =>['required'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'role_name' => ['required', 'string', 'max:255'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'username' => $data['username'],
            'role_name' => $data['role'],
            'country' => $data['country'],
            //'district'=>$data ['district'],
            //'role_id' =>$data['role_id'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
        ]);
    }
}
