<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBookingReferralsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('booking_referrals', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('referrer_id')->unsigned();
            $table->bigInteger('referred_id')->unsigned();
            $table->decimal('discount',20,2);
            $table->tinyInteger('is_applied')->default(0);
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
        Schema::dropIfExists('booking_referrals');
    }
}
