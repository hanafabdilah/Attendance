<?php

namespace App\Http\Controllers;

use App\Traits\ImageStorage;
use Illuminate\Http\Request;
use App\User;

class MyAccountController extends Controller
{
    use ImageStorage;

    public function index()
    {
        return view('pages.myaccount.index');
    }

    public function update(Request $request, $id)
    {
        $user = User::find($id);
        $photo = $request->file('image');
        $cekemail = User::where('email', $request->email)->whereNotIn('email', [$user->email])->count();

        if ($cekemail < 1) {
            if ($photo) {
                $request['photo'] = $this->uploadImage($photo, $request->name, 'profile', true, $user->photo);
            }
            $user->update($request->all());
            return back()->with('status', 'Success');
        }
        return back()->with('status', 'email is already in use');
    }
}
