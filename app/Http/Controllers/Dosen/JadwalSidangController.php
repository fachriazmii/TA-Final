<?php

namespace App\Http\Controllers\Dosen;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

use App\Models\Dosen\ModelInputJudul;
use App\Models\Mahasiswa\ModelPilihJudul;
use App\Models\Dosen\ModelRevisi;
use App\Models\Dosen\ModelNilaiPembimbing;
use App\Models\Dosen\ModelJadwalSidang;

use PDF;

class JadwalSidangController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = DB::table('proposal')
                        ->select('file_repo.id as id_repo','proposal.id as id_proposal','judul_ta.judul','mahasiswa.nim','mahasiswa.nama','mahasiswa.program_studi','mahasiswa.fakultas','file_repo.nama as nama_file','proposal.status')
                        ->join('judul_ta', 'judul_ta.id', '=', 'proposal.id_judul')
                        ->join('mahasiswa', 'mahasiswa.nim', '=', 'proposal.nim')
                        ->join('file_repo', 'proposal.id_repo', '=', 'file_repo.id')
                        ->join('revisi_proposal', 'revisi_proposal.nim', '=', 'mahasiswa.nim')
                        ->where('revisi_proposal.status_revisi', 'Selesai')
                        ->get();

        return view('page.dosen.pelaksanaan-sidang.jadwal-sidang.index', ['data' => $data]);
    }

    public function create($id){
        $data = DB::table('proposal')
                ->select('file_repo.id as id_repo','proposal.id as id_proposal','judul_ta.judul','mahasiswa.nim','mahasiswa.nama','mahasiswa.program_studi','mahasiswa.fakultas','file_repo.nama as nama_file','proposal.status')
                ->join('judul_ta', 'judul_ta.id', '=', 'proposal.id_judul')
                ->join('mahasiswa', 'mahasiswa.nim', '=', 'proposal.nim')
                ->join('file_repo', 'proposal.id_repo', '=', 'file_repo.id')
                ->join('revisi_proposal', 'revisi_proposal.nim', '=', 'mahasiswa.nim')
                ->where('revisi_proposal.status_revisi', 'Selesai')
                ->where('mahasiswa.nim', $id)
                ->first();

        // dd($data);

        return view('page.dosen.pelaksanaan-sidang.jadwal-sidang.create', ['data' => $data]);
    }

    public function store(Request $request){
        
        $validatedData = $request->validate([
            'tanggal_sidang' => 'required',
            'jam_sidang' => 'required',
        ]);

        $input = ModelJadwalSidang::create([
            'nim' => $request->nim,
            'datetime' => $request->tanggal_sidang,
            'jam' => $request->jam_sidang,
        ]);

        DB::table('revisi_proposal')->where('nim', $request->nim)->update([
            'status_revisi' => 'Sidang'
        ]);
        
        DB::table('proposal')->where('nim', $request->nim)->update([
            'status' => 'Sidang'
        ]);

        return redirect('/jadwal-sidang')->with('success','Berhasil menambahkan data');

    }

    public function lihat_jadwal_sidang()
    {
        $data = DB::table('proposal')
                        ->select('file_repo.id as id_repo','proposal.id as id_proposal','judul_ta.judul','mahasiswa.nim','mahasiswa.nama','file_repo.nama as nama_file','file_repo.local_path','proposal.status', 'jadwal_ta.datetime as tanggal_sidang', 'jadwal_ta.jam as jam_sidang')
                        ->join('judul_ta', 'judul_ta.id', '=', 'proposal.id_judul')
                        ->join('mahasiswa', 'mahasiswa.nim', '=', 'proposal.nim')
                        ->join('file_repo', 'proposal.id_repo', '=', 'file_repo.id')
                        ->join('revisi_proposal', 'revisi_proposal.nim', '=', 'mahasiswa.nim')
                        ->join('jadwal_ta', 'jadwal_ta.nim', '=', 'mahasiswa.nim')
                        ->where('revisi_proposal.status_revisi', 'Sidang')
                        ->orderBy('jadwal_ta.datetime', 'ASC')
                        ->orderBy('jadwal_ta.jam', 'ASC')
                        ->get();

        return view('page.dosen.pelaksanaan-sidang.jadwal-sidang.lihat-jadwal', ['data' => $data]);
    }
    
    public function lihat_hasil_sidang()
    {
        $data = DB::table('proposal')
                        ->select('file_repo.id as id_repo','proposal.id as id_proposal','judul_ta.judul','mahasiswa.nim','mahasiswa.nama','file_repo.nama as nama_file','file_repo.local_path','proposal.status', 'jadwal_ta.datetime as tanggal_sidang', 'jadwal_ta.jam as jam_sidang')
                        ->join('judul_ta', 'judul_ta.id', '=', 'proposal.id_judul')
                        ->join('mahasiswa', 'mahasiswa.nim', '=', 'proposal.nim')
                        ->join('file_repo', 'proposal.id_repo', '=', 'file_repo.id')
                        ->join('revisi_proposal', 'revisi_proposal.nim', '=', 'mahasiswa.nim')
                        ->join('jadwal_ta', 'jadwal_ta.nim', '=', 'mahasiswa.nim')
                        ->where('revisi_proposal.status_revisi', 'Lulus')
                        ->orderBy('jadwal_ta.datetime', 'ASC')
                        ->orderBy('jadwal_ta.jam', 'ASC')
                        ->get();
                        
                        return view('page.dosen.pelaksanaan-sidang.hasil-sidang.index', ['data' => $data]);
                    }
                    
    public function cetak_hasil_sidang($id)
    {
        $data =  DB::table('mahasiswa')
                    ->select('mahasiswa.nim','mahasiswa.nama','nilai_pembimbing.pbb1', 'nilai_pembimbing.pbb2', 'nilai_pembimbing.nilai_pbb1', 'nilai_pembimbing.nilai_pbb2', 'nilai_pembimbing.rata_rata as nilai_pembimbing_rata_rata', 'nilai_pembimbing.nilai_akhir as nilai_pembimbing_nilai_akhir', 'jadwal_ta.datetime as tanggal_sidang', 'jadwal_ta.jam as jam_sidang')
                    ->join('nilai_penguji', 'nilai_penguji.nim', '=', 'mahasiswa.nim')
                    ->join('nilai_pembimbing', 'nilai_pembimbing.nim', '=', 'mahasiswa.nim')
                    ->join('jadwal_ta', 'jadwal_ta.nim', '=', 'mahasiswa.nim')
                    ->where('mahasiswa.nim','=', $id)
                    ->first();
        
        $data_judul = DB::table('proposal')
                        ->join('judul_ta', 'judul_ta.id', '=', 'proposal.id_judul')
                        ->where('proposal.nim','=', $id)
                        ->first();

        return view('page.dosen.pelaksanaan-sidang.hasil-sidang.cetak',['data'=>$data, 'data_judul'=>$data_judul]);

        // $pdf = PDF::loadview('page.dosen.pelaksanaan-sidang.hasil-sidang.cetak',['data'=>$data, 'data_judul'=>$data_judul]);
	    // return $pdf->download('hasil-sidang-pdf');
    }
}
