<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBookingAddOnsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('booking_add_ons', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('booking_id')->unsigned();
            $table->bigInteger('add_on_id')->unsigned();
            $table->decimal('price',20,2);
            $table->integer('qty');
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
        Schema::dropIfExists('booking_add_ons');
    }
}
