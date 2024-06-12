<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDefectTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('defect', function (Blueprint $table) {
            $table->bigIncrements('def_id');
            $table->string('def_title',70);
            $table->string('def_desc',255);
            $table->int('def_status')->comment('1-New, 2-Assigned, 3-Open, 4-Fixed, 5-Pending Retest, 6-Retest, 7-Verified, 8-Closed');
            $table->int('def_severity')->comment('1-Critical, 4-Major, 3-Moderate, 2-Minor, 1-Cosmetic');
            $table->string('def_actual_result',255);
            $table->string('def_expected_result',255);
            $table->int('project_id');
            $table->int('user_id');
            $table->timestamp('create_date')->useCurrent();
            $table->timestamp('update_date');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('defect');
    }
}
