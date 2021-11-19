<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddAvailableQtyItineraryAddOnsTable extends Migration
{
    public function up()
    {
        Schema::table('itinerary_add_ons', function (Blueprint $table) {
            $table->integer('available_qty')->default(1)->after('price');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('itinerary_add_ons', function (Blueprint $table) {
            $table->dropColumn('available_qty');
        });
    }
}
