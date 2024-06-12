@extends('layouts.app2')

<style>
    div{
        margin:5px
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
        grid-template-columns: 60px 1050px 160px;
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

    .defectTitle{
        font-size:20px;
        font-weight:bold;
    }

    .createdBy{
        color: #A4A4AA;
        padding: 2px;
    }

    .defectDesc{
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

    .status-severity{
        margin-top:15px;
        display: flex;
        padding: 0;
    }

    .status{
        border: 0.5px solid #DBDEE4;
        border-radius: 50px;
        padding: 2px 8px;
        color: #7F7F84;
        background-color: #EDF0F3;
    }

    .severity{
        border: 1px solid #DBDEE4;
        border-radius: 100px;
        padding: 2px 7px;
        color: #7F7F84;
        background-color: #EDF0F3;
    }

    .align-right{
        display: flex;
        align-items: flex-end;
        padding-bottom:10px;
    }

    .align-right a{
        margin-bottom: 20px;
        color: #E97070;
    }

    .align-right a:hover{
        color: red;
    }

    .primary-btn{
        padding: 14px 20px;
        margin: 8px 0 8px 15px;
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

</style>

@section('dashboard')
@endsection
@section('content')

<div>
@foreach($input as $item)
    <a href="{{route('defect.create', $item->id)}}">
    @endforeach
    <button class='create-btn'>Create Defect</button>
    </a>
    <form action="{{route('defect.search',$input[0]->id)}}" method="get" enctype="multipart/form-data">
        @csrf
        <input type="text" name="def_id" placeholder="Search by defect title" />
        <!-- <select name="filterProject"><option value=''>Project</option></select> -->
        <select name="filterSeverity">
            <option value=''>Severity</option>
            <option value='Critical'>Critical</option>
            <option value='Major'>Major</option>
            <option value='Moderate'>Moderate</option>
            <option value='Minor'>Minor</option>
            <option value='Cosmetic'>Cosmetic</option>
        </select>
        <select name="filterStatus">
            <option value=''>Status</option>
            <option value='New'>New</option>
            <option value='Assigned'>Assigned</option>
            <option value='Open'>Open</option>
            <option value='Fixed'>Fixed</option>
            <option value='Pending Retest'>Pending Retest</option>
            <option value='Retest'>Retest</option>
            <option value='Verified'>Verified</option>
            <option value='Closed'>Closed</option>
        </select>
        <button class='primary-btn'>Go</button>
    </form>
</div>

@foreach($data as $item)
    <div class='card'>
        <div class='profile'>
            <img src="/images/avatar.png" alt="Avatar" style="width:50px">
        </div>
        <div class='content'>
            <div class='status-severity'>
            <div class='defectTitle'>{{$item->def_title}}</div>
                @if ($item->def_status=='New')
                    <div class='status'>new</div>
                @elseif ($item->def_status=='Assigned')
                    <div class='status'>assigned</div>
                @elseif ($item->def_status=='Open')
                    <div class='status'>opened</div>
                @elseif ($item->def_status=='Fixed')
                    <div class='status'>fixed</div>
                @elseif ($item->def_status=='Pending Retest')
                    <div class='status'>pending</div>
                @elseif ($item->def_status=='Retest')
                    <div class='status'>retest</div>
                @elseif ($item->def_status=='Verified')
                    <div class='status'>verified</div>
                @elseif ($item->def_status=='Closed')
                    <div class='status'>closed</div>
                @endif

                @if ($item->def_severity=='Critical')
                    <div class='severity'>critical</div>
                @elseif ($item->def_severity=='Major')
                    <div class='severity'>major</div>
                @elseif ($item->def_severity=='Moderate')
                    <div class='severity'>moderate</div>
                @elseif ($item->def_severity=='Minor')
                    <div class='severity'>minor</div>
                @elseif ($item->def_severity=='Cosmetic')
                    <div class='severity'>cosmetic</div>
                @endif
            </div>
            <div class='createdBy'>Posted By: {{$item->name}} ({{$item->role_name}}) {{$item->created_at}}</div>
            <div class='defectDesc'>{{$item->def_desc}}</div>
        </div>
        <div class='align-right' style='margin:0;'>  
            <a href="{{route('defect.delete', [$item->project_id, $item->def_id])}}">Delete</a>
            <a href="{{route('defect.edit', [$item->project_id, $item->def_id])}}"><button class='primary-btn'>Read</button></a>
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