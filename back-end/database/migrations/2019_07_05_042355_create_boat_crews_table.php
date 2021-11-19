<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBoatCrewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('boat_crews', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('crew_type_id')->unsigned();
            $table->bigInteger('guest_title_id')->unsigned()->nullable();
            $table->string('first_name',70);
            $table->string('last_name',70);
            $table->string('middle_name',70);
            $table->date('birth_date')->nullable();
            $table->bigInteger('nationality_id')->unsigned()->nullable();
            $table->string('phone_number',50);
            $table->string('email',50);
            $table->string('pob_country')->nullable();
            $table->string('pob_city')->nullable();
            $table->string('current_residency')->nullable();
            $table->bigInteger('identification_card_type_id')->unsigned()->nullable();
            $table->string('other_id_type',50)->nullable();
            $table->string('id_number',50)->nullable();
            $table->string('passport_number',50)->nullable();
            $table->string('expiration_date',7)->nullable();
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
        Schema::dropIfExists('boat_crews');
    }
}
