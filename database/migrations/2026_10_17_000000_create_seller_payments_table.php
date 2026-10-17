<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSellerPaymentsTable extends Migration
{
    public function up()
    {
        if (Schema::hasTable('seller_payments')) {
            return;
        }

        Schema::create('seller_payments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('seller_id')->nullable();
            $table->double('amount', 8, 2)->default(0);
            $table->text('payment_details')->nullable();
            $table->string('payment_method')->nullable();
            $table->string('txn_code')->nullable();
            $table->timestamps();

            $table->index('seller_id', 'seller_payments_seller_id_index');
            $table->index('created_at', 'seller_payments_created_at_index');
            $table->foreign('seller_id', 'seller_payments_seller_id_foreign')
                ->references('id')
                ->on('users')
                ->onDelete('set null');
        });
    }

    public function down()
    {
        // Preserve financial history if this migration is rolled back.
    }
}
