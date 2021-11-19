<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBookingCabinDiscountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('booking_cabin_discounts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('booking_cabin_id')->unsigned();
            $table->string('discount_description');
            $table->decimal('qty',20,2);
            $table->decimal('amount',20,2);
            $table->decimal('total',20,2);
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
        Schema::dropIfExists('booking_cabin_discounts');
    }
}
