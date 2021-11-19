<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Validator;
use Storage;

class UserController extends Controller
{

    public function validateOldPassword(Request $request)
    {

        $current_user = User::find(Auth::id());
        $user = $current_user->makeVisible('password')->toArray();

        if ($current_user && Hash::check($request->password, $user['password'])) {
            return response('Ok!', 200);
        } else {
            return response('Not Found!', 404);
        }
    }

    public function saveNewPassword(Request $request)
    {

        $current_user = User::find(Auth::id());
        $user = $current_user->makeVisible('password')->toArray();

        if ($current_user && Hash::check($request->old_password, $user['password'])) {
//            return response('Ok!', 200);
        } else {
            return response('Not Found!', 404);
        }

        $this->validate($request, [
            'password' => 'min:8|required_with:password_confirmation',
            'password_confirmation' => 'min:8|same:password'
        ]);

        $current_user->password = bcrypt($request->password);
        $current_user->save();

        return response($current_user);
    }

    public function uploadProfilePicture(Request $request)
    {

        $rules = array(
            'photo' => 'mimes:jpeg,jpg,png|required|max:10000' // max 10000kb
        );

        $image = $request->file('photo');

        $validator = Validator::make(['photo' => $image], $rules);

        $fileName = time() . '.' . $image->getClientOriginalExtension();

        if ($validator->fails())
        {
            return response()->json(['error' => $validator->errors()->getMessages()], 400);
        } else{
            $current_user = User::find(Auth::id());
            $current_user->image = 'original_'.$fileName;
            $current_user->thumbnail = 'thumbnail_'.$fileName;
            $current_user->save();

            $image->storeAs('public/images/original', 'original_'.$fileName);

            $img = Image::make($image->getRealPath());
            $img->resize(180, 80, function ($constraint) {
                $constraint->aspectRatio();
            });
            $img->stream(); // <-- Key point
            Storage::disk('local')->put('public/images/thumbnail' . '/' . 'thumbnail_' . $fileName, $img, 'public');
            return response()->json($current_user, 200);
        }


    }

}


