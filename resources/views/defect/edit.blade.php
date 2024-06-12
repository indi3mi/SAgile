@extends('layouts.app2')

<style>
.primary-btn {
    background: #084fe7;
    color: #fff;
    border: 1px solid #0099ff;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 14px;
    font-weight: 600;
    text-transform: uppercase;
    display: inline-block;
    transition: all 0.3s ease 0s;
    cursor: pointer;
    margin-top: 20px;
    margin-bottom: 20px;
    margin-left: 50%;
    margin-right: 50%;
    text-align: center;
}
    
body {
	height: 100%;
}

body {
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	font-family: sans-serif;
	font-weight: 100;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	width: 1000px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0,0,0,0.1);
}

th,
td {
	padding: 15px;
	background-color: rgba(255,255,255,0.2);
	color: rgb(250, 250, 250);
}

th {
	text-align: left;
}

thead {
	th {
		background-color: #55608f;
	}
}

tbody {
	tr {
		&:hover {
			background-color: rgba(255,255,255,0.3);
		}
	}
	td {
		position: relative;
		&:hover {
			&:before {
				content: "";
				position: absolute;
				left: 0;
				right: 0;
				top: -9999px;
				bottom: -9999px;
				background-color: rgba(255,255,255,0.2);
				z-index: -1;
			}
		}
	}
}

select{
	width: 100%;
	padding: 2px 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

</style>

@section('dashboard')

@endsection

@section('content')

@foreach($data as $item[0])
    <form action="{{route('defect.update', [$item[0]->project_id, $item[0]->def_id])}}" method="post" enctype="multipart/form-data">    

    @csrf

    <div class="flex flex-wrap mb-6">
        <input hidden type='int' value="{{ $item[0]->def_id }}" name='def_id' />

    <div class="container">
        <table>
			<br>
			<h1 style="color: white; text-align: center; font-size:30px; font-family: Georgia, sans-serif; letter-spacing: 2px;"><b>DESCRIPTION</b></h1>
            <thead>
            <tr><th>Defect ID</th>
				<th>Defect Title</th>
				<th>Defect Description</th>
				<th>Defect Status</th>
				<th>Defect Severity</th>
                <th>Defect Actual Results</th>
                <th>Defect Expected Results</th>
                <th>Defect Flow</th>
                <th>Defect Attachment</th>
			</tr>
		</thead>
        <tbody>
			<tr>
				<td>{{$item[0]->def_id }}</td>
				<td>{{$item[0]->def_title}}</td>
				<td>{{ $item[0]->def_desc }}</td>
				<td><select id="def_status" type="text" required autocomplete="def_status" autofocus class="form-input w-full @error('name')  border-red-500 @enderror" name="def_status">{{ old('def_status') }}>
					<option value="New" @if($item[0]->def_status == 'New') selected @endif >1 - New</option>
                    <option value="Assigned" @if($item[0]->def_status == 'Assigned') selected @endif >2 - Assigned</option>
                    <option value="Open" @if($item[0]->def_status == 'Open') selected @endif >3 - Open</option>
                    <option value="Fixed" @if($item[0]->def_status == 'Fixed') selected @endif >4 - Fixed</option>
                    <option value="Pending Retest" @if($item[0]->def_status == 'Pending Retest') selected @endif >5 - Pending Retest</option>
                    <option value="Retest" @if($item[0]->def_status == 'Retest') selected @endif >6 - Retest</option>
                    <option value="Verified" @if($item[0]->def_status == 'Verified') selected @endif >7 - Verified</option>
                    <option value="Closed" @if($item[0]->def_status == 'Closed') selected @endif >8 - Closed</option>
                </select></td>
				<td>{{ $item[0]->def_severity }}</td>
                <td>{{ $item[0]->def_actual_result }}</td>
                <td>{{ $item[0]->def_expected_result }}</td>
                <td>{{ $item[0]->def_flow }}</td>
                <td>{{ $item[0]->def_attachment }}</td>
			</tr>
        </tbody>      
        </table>
        <br>

		<a href="{{route('defect.update', [$item[0]->project_id, $item[0]->def_id])}}"><button class='primary-btn'>Update</button></a>
		<br><br><br>

           
    </form>
@endforeach
@endsection('content')
        