<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItineraryCrewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('itinerary_crews', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('itinerary_id')->unsigned();
            $table->bigInteger('crew_type_id')->unsigned();
            $table->bigInteger('boat_crew_id')->unsigned();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('itinerary_crews');
    }
}
