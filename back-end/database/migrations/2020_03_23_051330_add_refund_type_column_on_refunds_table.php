<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddRefundTypeColumnOnRefundsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('refunds', function (Blueprint $table) {
            $table->bigInteger('refund_type_id')->default(1)->after('description');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('refunds', function (Blueprint $table) {
            $table->dropColumn('refund_type_id');
        });
    }
}
