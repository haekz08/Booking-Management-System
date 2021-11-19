<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBookingInvoicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('booking_invoices', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('booking_id')->unsigned();
            $table->string('invoice_number');
            $table->decimal('sub_total',20,2);
            $table->decimal('discount',20,2);
            $table->decimal('grand_total',20,2);
            $table->decimal('deposit_amount_due',20,2);
            $table->bigInteger('payment_terms')->unsigned()->comment('1=FULL PAYMENT, 2=DEPOSIT');
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
        Schema::dropIfExists('booking_invoices');
    }
}
