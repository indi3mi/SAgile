<?php

//namespace App;

namespace App\Http\Middleware;
use Closure;
use Illuminate\Auth\Middleware\Role as Middleware;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $table = 'roles';

    protected $fillable = ['role_name'];

    public $primaryKey = 'role_id';

    // public function handle($request, Closure $next, String $role) {
    //     // if (!Auth::check()) // This isnt necessary, it should be part of your 'auth' middleware
    //     //  return redirect('/home');
    
    //     // $user = Auth::user();
    //     // if($user->role_name == $role)
    //     //   return $next($request);
    
    //     // return redirect('/home');

    //     if (Auth::role($role)->check()) {
    //       $role = Auth::user()->role; 
    //   switch ($role) {
    //     case 'User':
    //       return '/user/home';
    //       break;
    //     case 'Scrum Master':
    //       return '/scrum/home';
    //       break;
    //     default:
    //       return '/home'; 
    //     break;
    //     }
    //   }
    //   return $next($request);
    //   }
    public function handle($request, Closure $next, $guard = null)
    {
        if (Auth::guard($guard)->check()) {
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

        return $next($request);
    }
}
