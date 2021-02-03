<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Yajra\DataTables\Facades\DataTables;

use App\Traits\ImageStorage;
use App\User;

class UserController extends Controller
{
    use ImageStorage;

    /**
     * Construct
     * @return void
     */
    public function __construct()
    {
        $this->middleware(['auth', 'is_admin']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function myaccount()
    {
        echo 'tes';
    }

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = User::query();

            return DataTables::eloquent($data)
                ->addColumn('action', function ($data) {
                    return view('layouts._action', [
                        'model' => $data,
                        'edit_url' => route('user.edit', $data->id),
                        'show_url' => route('user.show', $data->id),
                        'delete_url' => route('user.destroy', $data->id),
                    ]);
                })
                ->addIndexColumn()
                ->rawColumns(['action'])
                ->toJson();
        }

        // $users = User::paginate(5);
        return view('pages.user.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pages.user.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $cekmail = User::where('email', $request->email)->count();
        if ($cekmail < 1) {
            $photo = $request->file('image');

            if ($photo) {
                $request['photo'] = $this->uploadImage($photo, $request->name, 'profile');
            }

            $request['password'] = Hash::make($request->password);

            User::create($request->all());

            return back()->with('status', 'Success');
        }
        return back()->with('status', 'Email is already in use');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::findOrFail($id);
        return view('pages.user.show', compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::findOrFail($id);
        return view('pages.user.edit', compact('user'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);
        $photo = $request->file('image');
        $cekemail = User::where('email', $request->email)->whereNotIn('email', [$user->email])->count();

        if ($cekemail < 1) {
            if ($photo) {
                $request['photo'] = $this->uploadImage($photo, $request->name, 'profile', true, $user->photo);
            }

            if ($request->password) {
                $request['password'] = Hash::make($request->password);
            } else {
                $request['password'] = $user->password;
            }

            $user->update($request->all());
            return back()->with('status', 'Success');
        }
        return back()->with('status', 'Email is already use');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        if ($user->is_admin == 0) {
            if ($user->photo) {
                $this->deleteImage($user->photo, 'profile');
            }

            $user->delete();
            $user->attendances->delete();

            return back()->with('status', 'Success');
        }
        return back()->with('status', 'Cannot delete admin');
    }
}
