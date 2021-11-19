<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItinerariesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('itineraries', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('itinerary_brand_id')->unsigned();
            $table->bigInteger('itinerary_country_id')->unsigned();
            $table->text('disclaimer')->nullable();
            $table->date('check_in_date');
            $table->time('check_in_time');
            $table->date('check_out_date');
            $table->time('check_out_time');
            $table->bigInteger('city_id_from')->unsigned();
            $table->bigInteger('city_id_to')->unsigned();
            $table->bigInteger('city_port_id_from')->unsigned();
            $table->bigInteger('city_port_id_to')->unsigned();
            $table->tinyInteger('is_locked_to_ambassador');
            $table->bigInteger('ambassador_id')->unsigned()->nullable();

            $table->tinyInteger('is_shared_offered')->default(1);
            $table->tinyInteger('is_private_offered')->default(1);
            $table->tinyInteger('is_double_offered')->default(1);

            $table->tinyInteger('is_referral_active');
            $table->decimal('referral_price',20,2);
            $table->tinyInteger('is_early_bird_active');
            $table->date('early_bird_cut_off_date')->nullable();
            $table->bigInteger('boat_id')->unsigned();
            $table->tinyInteger('is_private_charter_active');
            $table->decimal('private_charter_price',20,2);
            $table->decimal('deposit_per_person',20,2);
            $table->tinyInteger('is_displayed')->default(1);
            $table->tinyInteger('is_cabin_same_price')->default(1);


            $table->decimal('price_per_person',20,2)->nullable();
            $table->decimal('cabin_price',20,2)->nullable();
            $table->decimal('early_bird_price',20,2)->nullable();
            $table->decimal('cabin_early_bird_price',20,2)->nullable();

            $table->tinyInteger('is_cancelled')->default(0);
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
        Schema::dropIfExists('itineraries');
    }
}
