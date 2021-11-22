<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;

class LoginController extends Controller
{
    public function index(){
        return view('login.login-view');
    }

    public function postlogin(Request $request){
        if(Auth::attempt($request->only('email','password'))){
            return redirect('/');
        }
        return redirect('/login');
    }
    
    public function logout(){
        Auth::logout();
        return redirect('/login');
    }
}
