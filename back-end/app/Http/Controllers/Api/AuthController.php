<?php

namespace App\Http\Controllers\Api;

use App\Role;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Laravel\Passport\Http\Controllers\AccessTokenController;
use phpseclib\Crypt\Hash;
use Psr\Http\Message\ServerRequestInterface;

class AuthController extends AccessTokenController
{
    public function register(Request $request)
    {

        $validatedData = $request->validate([
            'name' => 'required|max:55',
            'email' => 'email|unique:users|required',
            'password' => 'required|confirmed'
        ]);

        $validatedData['password'] = bcrypt($request->password);

        $user = User::create($validatedData);

        $accessToken = $user->createToken('authToken')->accessToken;

        return response(['user' => $user, 'access_token' => $accessToken]);

    }

    public function login(Request $request)
    {

        $loginData = $request->validate([
            'email' => 'email|required',
            'password' => 'required'
        ]);

        if (!auth()->attempt($loginData)) {
            return response(['message' => 'Invalid Credentials']);
        }

        $accessToken = auth()->user()->createToken('authToken')->accessToken;

        return response(
            [
                'user' => User::with(['role' => function ($data) {
                    return $data->with(['role_routes' => function ($data) {
                        return $data->with('children', 'route_metas');
                    }]);
                }])->find(Auth::id()),
                'access_token' => $accessToken,
            ]
        );
    }

    public function auth(ServerRequestInterface $request)
    {
        $tokenResponse = parent::issueToken($request);

        $token = $tokenResponse->getContent();

        // $tokenInfo will contain the usual Laravel Passort token response.
        $tokenInfo = json_decode($token, true);

        // Then we just add the user to the response before returning it.
        $username = $request->getParsedBody()['username'];

        $user = User::with(['guest_lists','role' => function ($data) {
            return $data->with(['role_routes' => function ($data) {
                return $data->with('children', 'route_metas');
            }]);
        }])->whereEmail($username)->first();
        $tokenInfo = collect($tokenInfo);
        $tokenInfo->put('user', $user);


        if (isset($tokenInfo['error']) && $tokenInfo['error'] == 'invalid_credentials')
            return response('Incorrect Username or Password!', 404);

        return response($tokenInfo);
    }

    public function get(Request $request)
    {
        return response(
            [
                'user' => User::with(['role' => function ($data) {
                    return $data->with(['role_routes' => function ($data) {
                        return $data->with('children', 'route_metas');
                    }]);
                }])->find(Auth::id())
            ]
        );
    }
}
