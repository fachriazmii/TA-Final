<?php

namespace App\Http\Controllers\Mahasiswa;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\File;
use Carbon\Carbon;

use App\Models\Dosen\ModelInputJudul;
use App\Models\Mahasiswa\ModelPilihJudul;
use App\Models\Mahasiswa\ModelFileRepo;

class StatusController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = DB::table('proposal')
                        ->join('judul_ta', 'judul_ta.id', '=', 'proposal.id_judul')
                        ->join('mahasiswa', 'mahasiswa.nim', '=', 'proposal.nim')
                        ->where('proposal.nim', '=', auth()->user()->username)
                        ->get();

        // dd($data); exit();
        return view('page.mahasiswa.status.index', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // $data = DB::table('mahasiswa')->where('nim', auth()->user()->username)->first();
        $data = DB::table('proposal')
                        ->join('judul_ta', 'judul_ta.id', '=', 'proposal.id_judul')
                        ->join('mahasiswa', 'mahasiswa.nim', '=', 'proposal.nim')
                        ->where('mahasiswa.nim', auth()->user()->username)
                        ->first();

        return view('page.mahasiswa.status.create', ['data' => $data]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = DB::table('proposal')
                        ->join('judul_ta', 'judul_ta.id', '=', 'proposal.id_judul')
                        ->join('mahasiswa', 'mahasiswa.nim', '=', 'proposal.nim')
                        ->where('mahasiswa.nim', auth()->user()->username)
                        ->first();

        $validatedData = $request->validate([
            'upload_file' => 'required|mimes:pdf|file|max:2048',
        ]);

        $file = $request->file('upload_file');

        if($file){
            $filename = $data->nim."-".$data->nama."-".$data->judul.".pdf";
            $request->file('upload_file')->storeAs('repo', $filename);
            $Savefile = ModelFileRepo::create([
                'nama' => $filename,
                'local_path' => 'storage/repo/'.$filename,
            ]);

            DB::table('proposal')->where('nim', auth()->user()->username)->update([
                'id_repo' => $Savefile->id
            ]);

            return redirect('/status');
        }
        // $orignal_filename = time().$file->getClientOriginalName();
        // return $orignal_filename;

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
        
    }

    public function delete($id)
    {
        
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
