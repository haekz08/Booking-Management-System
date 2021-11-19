<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBoatCabinsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('boat_cabins', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('boat_id')->unsigned();
            $table->bigInteger('cabin_type_id')->unsigned();
            $table->string('code');
            $table->string('cabin_description')->nullable();
            $table->integer('occupancy');
            $table->tinyInteger('is_active')->default(1);
            $table->bigInteger('created_by')->unsigned();
            $table->bigInteger('updated_by')->unsigned();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('boat_cabins');
    }
}
