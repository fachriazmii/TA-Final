<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ModelDosen;
use Illuminate\Support\Facades\DB;

class DosenController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dosen = ModelDosen::all(); 
        
        return view('form.dosen.index', ['data' => $dosen]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('form.dosen.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input = $request->all();

        $post = ModelDosen::create($input);
        
        return redirect('/dosen')->with('success','Berhasil menambahkan data.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // $dosen = ModelDosen::all()->where('id', $id);
        $dosen = DB::table('dosen')->where('id', $id)->first();

        // var_dump($dosen);exit();
        
        return view('form.dosen.edit', ['data' => $dosen]);
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
        DB::table('dosen')->where('id', $request->id)->update([
            'nama_dosen' => $request->nama_dosen,
            'no_hp' => $request->no_hp,
            'email' => $request->email,
        ]);
        return redirect('/dosen')->with('success','Berhasil mengedit data.');
    }

    public function delete($id)
    {
        ModelDosen::destroy($id);

        return redirect('/dosen')->with('success','Berhasil menghapus data.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
