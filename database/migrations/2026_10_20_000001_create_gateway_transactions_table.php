<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGatewayTransactionsTable extends Migration
{
    public function up()
    {
        Schema::create('gateway_transactions', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->unsignedBigInteger('id', true);
            $table->enum('provider', [
                'MELLAT', 'SADAD', 'SAMAN', 'PARSIAN', 'MABNA', 'MABNA_OLD',
                'IRANKISH', 'ASANPARDAKHT', 'PAYIR', 'PARDANO', 'ZARINPAL',
                'NEXTPAY', 'JIBIT', 'SABAPAY', 'SIZPAY',
            ]);
            $table->decimal('amount', 15, 2);
            $table->string('currency', 3)->nullable();
            $table->string('ref_id', 100)->nullable();
            $table->string('tracking_code', 50)->nullable();
            $table->string('card_number', 50)->nullable();
            $table->enum('status', ['INIT', 'SUCCEEDED', 'FAILED'])->default('INIT');
            $table->string('ip', 20)->nullable();
            $table->json('extra')->nullable();
            $table->timestamp('paid_at')->nullable();
            $table->nullableTimestamps();
            $table->softDeletes();
        });
    }

    public function down()
    {
        Schema::dropIfExists('gateway_transactions');
    }
}
