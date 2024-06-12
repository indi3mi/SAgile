@extends('layouts.app2')
<script>
    function displayComment(){
        document.getElementById('add-comment').style.display = 'block';
        document.getElementById('btnSection').style.display = 'none';
    }
    function hideComment(){
        document.getElementById('add-comment').style.display = 'none';
        document.getElementById('btnSection').style.display = 'block';
    }
</script>
<style>
    div{
        margin:5px
    }
    .card{
        display:grid;
        grid-template-columns: 60px auto;
        padding: 2px 16px;
        background-color: white;
        border-radius: 5px;
        margin:20px;
        box-shadow: 0 0px 0px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }
    img{
        margin-top:15px;
        border-radius: 50%;
    }

    .forumTitle{
        margin-top:15px;
        font-size:20px;
        font-weight:bold;
    }

    .forumTitle a{
        padding:2px;
        font-size:14px;
        color: #3C87B0;
    }

    .createdBy{
        color: #A4A4AA;
        padding: 2px;
    }

    .forumDesc{
        padding: 2px 5px 2px 2px;
        margin-bottom:15px;
    }
    button{
        padding: 10px 15px;
        margin: 8px 0;
        border-radius: 5px;
        cursor: pointer;
    }
    
    .align-right{
        text-align: right;
    }
    .primary-btn{
        background-color: #022133;
        box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
    }
    .primary-btn a{
        color: white;
    }

    .back-btn{
        margin-right:20px;
        border: 1px solid lightgrey;
        box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
    }

    a .back-btn{
        color: grey;
    }

    textarea{
        border: none;
        outline: none;
        margin-top: 10px;
        font-size: 16px;
        font-family: Arial, Helvetica, sans-serif;
    }

    #add-comment{
        margin-left: 50px;
    }

</style>

@section('dashboard')

                   
@endsection

@section('content')


@foreach($data as $item) 
<form action="{{route('forum.storeComment', $item->project_id)}}" method="post" enctype="multipart/form-data">
@csrf
        @if ($item->thread_parent==0)
        <input hidden type='int' value="{{ $item->forumID }}" name='parentID' />
        <input hidden type='int' value="{{ $item->project_id }}" name='project_id' />
        <div class='card' style="margin-top:50px">
            <div class='profile'>
                <img src="/images/avatar.png" alt="Avatar" style="width:50px">
            </div>
            <div class='content'>
                <div class='forumTitle'>{{$item->forumTitle}}<a href="{{route('forum.edit',[$item->forumID, $item->project_id])}}" style="margin-left:10px">Update</a></div>
            
        @else
        <div class='card' style="margin-left:50px">
            <div class='profile'>
                <img src="/images/avatar.png" alt="Avatar" style="width:50px">
            </div>
            <div class='content'>
                <div class=''>{{$item->forumTitle}}
            </div>
                
        @endif    
                <div class='createdBy'>Posted By: {{$item->name}} ({{$item->role_name}}) {{$item->created_at}}</div>
                <div class='forumDesc'>{{$item->forumDesc}}</div>
            </div>
        </div>
@endforeach

    <div id='btnSection' class='align-right' style='margin:0;'>
        <button type='button' class='primary-btn' style='color:white;' id='addBtn' onclick='displayComment()'>Add Comment</button>
        <a href="{{route('forum.index', $item->project_id)}}"><button type='button' class='back-btn'>Back</button></a>
    </div>
    
    <div id='add-comment' class='card' style='display:none;'>
        <textarea type='text' name='comment' id='comment' class='' cols='143' rows='4'></textarea>
        <div class='align-right' style='margin:0;'>
            <button type='submit' class='primary-btn' style='color:white;'>Post</button>
            <button type='button' class='back-btn' onclick='hideComment()' style='color:grey;'>Back</button>
        </div>
    </div>
</form>
<p></p>

</body>
</html>

@endsection