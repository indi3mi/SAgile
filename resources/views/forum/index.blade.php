@extends('layouts.app2')

<style>
    div{
        margin:5px;
    }

    a .create-btn{
        color: #36395A;
    }

    .create-btn{
        padding: 14px 20px;
        background-color: #C1D9E8;
        margin: 10px 20px 8px;
        border-radius: 5px;
        border: 0px;
        cursor: pointer;
        overflow: hidden;
        box-shadow: rgba(45, 35, 66, 0.4) 0 2px 4px,rgba(45, 35, 66, 0.3) 0 7px 13px -3px,#B4C6D1 0 -3px 0 inset;
        transition: box-shadow .15s,transform .15s;
        will-change: box-shadow,transform;
    }

    .create-btn:focus{
        box-shadow: #B4C6D1 0 0 0 1.5px inset, rgba(45, 35, 66, 0.4) 0 2px 4px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #B4C6D1 0 -3px 0 inset;
    }

    .create-btn:hover{
        box-shadow: rgba(45, 35, 66, 0.4) 0 4px 8px, rgba(45, 35, 66, 0.3) 0 7px 13px -3px, #B4C6D1 0 -3px 0 inset;
    }

    .create-btn:active {
        box-shadow: #B4C6D1 0 3px 7px inset;
        transform: translateY(2px);
    }

    .card{
        display:grid;
        grid-template-columns: 60px 900px 100px;
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

    .createdBy{
        color: #A4A4AA;
        padding: 2px;
    }

    .forumDesc{
        padding: 2px 5px 2px 2px;
        margin-bottom:15px;
    }

    input{
        margin-left: 20px;
        padding: 13px;
        width: 200px;
        border-radius: 5px;
        border: 1px solid lightgrey;
        color: grey;
    }

    select{
        padding: 13px;
        width: 300px;
        border-radius: 5px;
        border: 1px solid lightgrey;
        color: grey;
    }

    a:hover, a:link{
        text-align: center;
        text-decoration: none;
        display:inline-block;
    }

    .align-right{
        display: flex;
        align-items: flex-end;
        justify-content: center;
        padding-bottom:10px;
    }
    .primary-btn{
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        background-color: #022133;
        box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
        color: white;
    }

    .primary-btn:hover{
        background-color: #6C9DBA;
    }

    a .primary-btn{
        color: white;
    }
    .pagination {
        display: inline-block;
        color: black;
        float: left;
        padding: 8px 16px;
    }

    .pagination a {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
    }
    .pagination ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333333;
    }

    .pagination li {
    float: left;
    display: block;
    color: white;
    text-align: center;
    /* padding: 16px; */
    }

    .pagination li a, .pagination .active, .pagination .disabled {
    display: block;
    color: white;
    text-align: center;
    padding: 16px;
    text-decoration: none;
    }

    .pagination li a:hover {
    background-color: #111111;
    }
    .pagination nav{
        width: 250%;        
        padding: 15px;
        background:transparent;
    }
</style>

@section('dashboard')


@endsection

@section('content')
<div>
    @foreach($input as $item)
    <a href="{{route('forum.create',$item->id)}}">
    @endforeach
    <button class='create-btn'>Create Forum</button>
    </a>
    <form action="{{route('forum.search',$input[0]->id)}}" method="get" enctype="multipart/form-data">
        @csrf
        <input type="text" name="forumTitle" placeholder="Search by Forum Title" />
        <button class='primary-btn' type="submit"><a>Go</a></button>
    </form>
</div>
@foreach($data as $item)
    <div class='card'>
        <div class='profile'>
            <img src="/images/avatar.png" alt="Avatar" style="width:50px">
        </div>
        <div class='content'>
            <div class='forumTitle'>{{$item->forumTitle}}</div>
            <div class='createdBy'>Posted By: {{$item->name}} ({{$item->role_name}}) {{$item->created_at}}</div>
            <div class='forumDesc'>{{$item->forumDesc}}</div>
        </div>
        <div class='align-right' style='margin:0;'>
            <a href="{{route('forum.detail', [$item->project_id, $item->forumID])}}">
                <button class='primary-btn'>Read</button>
            </a>
        </div>
    </div>
@endforeach
<p></p>
<div class="pagination">
    {!! $data->links() !!}
</div>
</body>
</html>

@endsection