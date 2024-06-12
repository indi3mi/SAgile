<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateForumTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('forum', function (Blueprint $table) {
            $table->bigIncrements('forumID');
            $table->int('project_id');
            $table->string('forumTitle',50)->nullable($value = true);
            $table->string('forumDesc',255);
            $table->timestamp('updated_at')->useCurrent();
            $table->timestamp('created_at');
            $table->string('createdBy',50);
            $table->int('thread_parent')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('forum');
    }
}
