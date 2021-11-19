<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAmbassadorItineraryCodesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ambassador_itinerary_codes', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('itinerary_id')->unsigned();
            $table->bigInteger('ambassador_id')->unsigned();
            $table->string('code',15);
            $table->decimal('discount_amount',20,2);
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
        Schema::dropIfExists('ambassador_itinerary_codes');
    }
}
