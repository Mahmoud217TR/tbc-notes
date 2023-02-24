<?php

namespace App\Http\Controllers\API\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\LoginRequest;
use App\Http\Requests\User\RegisterRequest;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class UserController extends Controller
{
    public function login(LoginRequest $request){
        if($this->attemptLogin($request)){
            return $this->loginResponse(auth()->user());
        }else{
            throw ValidationException::withMessages([
                'email' => [trans('auth.failed')],
            ]);
        }
    }

    public function register(RegisterRequest $request){
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => $request->getHashedPassword(),
        ]);

        $this->attemptLogin($request);

        return $this->loginResponse($user);
    }

    public function logout(Request $request){
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'message' => "Logged Out Successfully",
        ]);
    }

    public function logoutFromAll(Request $request){
        $request->user()->tokens()->delete();

        return response()->json([
            'message' => "Logged Out Successfully",
        ]);
    }

    protected function attemptLogin($request){
        return Auth::guard()->attempt($request->only('email','password'));
    }

    protected function loginResponse(User $user){
        $data = collect();

        $data->put('user', new UserResource($user));
        $data->put('token', $user->createToken('login')->plainTextToken);

        return $data;
    }
}