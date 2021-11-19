<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBookingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('reference_code_char',4);
            $table->integer('reference_code');
            $table->bigInteger('itinerary_id')->unsigned();
            $table->bigInteger('user_id')->unsigned();
            $table->tinyInteger('is_early_bird')->default(0);
            $table->bigInteger('lead_source_id')->unsigned()->nullable();
            $table->bigInteger('ambassador_itinerary_code_id')->unsigned()->nullable();
            $table->tinyInteger('payment_reminder_sent')->default(0);
            $table->tinyInteger('balance_reminder_sent')->default(0);
            $table->tinyInteger('crew_details_reminder_sent')->default(0);
            $table->tinyInteger('is_active')->default(1);
            $table->tinyInteger('admin_booking')->default(0);
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
        Schema::dropIfExists('bookings');
    }
}
