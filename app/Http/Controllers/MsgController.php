<?php

namespace App\Http\Controllers;

use App\Models\Msg;
use Illuminate\Http\Request;

class MsgController extends Controller
{

    //
    public function push(Request $request){
        $request->ip();
        $email = $request->input('email');
        $content = $request->input('content');

        $request->validate([
            'email' => ['email'],
        ]);

        $msg = new Msg();
        $msg->email = $email;
        $msg->content = $content;

        return  response($msg->save());
    }
}
