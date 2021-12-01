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
}
