<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBookingInvoicePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('booking_invoice_payments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('invoice_payment_number');
            $table->bigInteger('booking_invoice_id')->unsigned();
            $table->bigInteger('payment_type_id')->unsigned();
            $table->longText('paypal_response')->nullable();
            $table->decimal('amount_paid',20,2);
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
        Schema::dropIfExists('booking_invoice_payments');
    }
}
