<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItineraryAddOnsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('itinerary_add_ons', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('itinerary_id')->unsigned();
            $table->bigInteger('add_on_id')->unsigned();
            $table->decimal('price',20,2);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('itinerary_add_ons');
    }
}
