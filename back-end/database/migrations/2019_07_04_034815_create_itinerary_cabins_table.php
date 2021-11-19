<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItineraryCabinsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('itinerary_cabins', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('boat_cabin_id')->unsigned();
            $table->bigInteger('itinerary_id')->unsigned();
            $table->bigInteger('ambassador_allocation')->default(0);
            $table->decimal('price_per_person',20,2);
            $table->decimal('cabin_price',20,2);
            $table->decimal('early_bird_price',20,2)->nullable();
            $table->decimal('cabin_early_bird_price',20,2)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('itinerary_cabins');
    }
}
