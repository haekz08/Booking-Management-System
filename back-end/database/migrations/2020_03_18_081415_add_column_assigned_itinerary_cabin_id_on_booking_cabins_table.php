<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnAssignedItineraryCabinIdOnBookingCabinsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('booking_cabins', function (Blueprint $table) {
            $table->bigInteger('original_itinerary_cabin_id')->after('guest_id')->default(-1);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('booking_cabins', function (Blueprint $table) {
            $table->dropColumn('original_itinerary_cabin_id');
        });
    }
}
