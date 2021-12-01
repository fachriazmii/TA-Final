<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

use App\Models\Dosen\ModelInputJudul;
use App\Models\Mahasiswa\ModelPilihJudul;
use App\Models\Dosen\ModelRevisi;

class PelaksanaanSidangController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = DB::table('proposal')
                        ->select('file_repo.id as id_repo','proposal.id as id_proposal','judul_ta.judul','mahasiswa.nim','mahasiswa.nama','file_repo.nama as nama_file','file_repo.local_path','proposal.status')
                        ->join('judul_ta', 'judul_ta.id', '=', 'proposal.id_judul')
                        ->join('mahasiswa', 'mahasiswa.nim', '=', 'proposal.nim')
                        ->join('file_repo', 'proposal.id_repo', '=', 'file_repo.id')
                        ->join('revisi_proposal', 'revisi_proposal.nim', '=', 'mahasiswa.nim')
                        ->where('proposal.approve_by', auth()->user()->username)
                        ->where('revisi_proposal.status_revisi', 'Selesai')
                        ->get();

        return view('page.dosen.pelaksanaan-sidang.index', ['data' => $data]);
    }

    public function edit($id){
        $data = DB::table('proposal')
                        ->select('file_repo.id as id_repo','proposal.id as id_proposal','judul_ta.judul','judul_ta.pbb1 as kode_dosen','judul_ta.kuota as kuota','mahasiswa.nim','mahasiswa.nama','file_repo.nama as nama_file','file_repo.local_path','proposal.status')
                        ->join('judul_ta', 'judul_ta.id', '=', 'proposal.id_judul')
                        ->join('mahasiswa', 'mahasiswa.nim', '=', 'proposal.nim')
                        ->join('file_repo', 'proposal.id_repo', '=', 'file_repo.id')
                        ->join('revisi_proposal', 'revisi_proposal.id_repo', '=', 'file_repo.id')
                        ->where('file_repo.id', $id)
                        ->first();

        return view('page.dosen.pelaksanaan-sidang.lihat-file', ['data' => $data]);
    }

    public function nilai_sidang(Request $request){
        // $proposal = DB::table('proposal')->where('nim', $request->id)->first();
        // $revisi_proposal = DB::table('revisi_proposal')->where('nim', $request->id)->first();

        DB::table('proposal')->where('nim', $request->id)->update([
            'status' => 'Lulus'
        ]);

        DB::table('revisi_proposal')->where('nim', $request->id)->update([
            'status_revisi' => 'Lulus'
        ]);

        return json_encode('Mahasiswa dinyatakan lulus sidang');
    }
}
