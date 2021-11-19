<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBookingCabinsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('booking_cabins', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('booking_id')->unsigned();
            $table->bigInteger('guest_id')->unsigned();
            $table->bigInteger('itinerary_cabin_id')->unsigned();
            $table->integer('occupancy');
            $table->tinyInteger('is_cabin_occupied');
            $table->decimal('price_per_person',20,2);
            $table->decimal('cabin_price',20,2);
            $table->decimal('early_bird_price',20,2);
            $table->decimal('cabin_early_bird_price',20,2);
            $table->decimal('total_amount_due',20,2);
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
        Schema::dropIfExists('booking_cabins');
    }
}
