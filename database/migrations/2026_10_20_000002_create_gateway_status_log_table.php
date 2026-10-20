<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGatewayStatusLogTable extends Migration
{
    public function up()
    {
        Schema::create('gateway_transactions_logs', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->unsignedBigInteger('transaction_id');
            $table->string('result_code', 255)->nullable();
            $table->string('result_message', 255)->nullable();
            $table->timestamp('log_date')->nullable();
            $table->foreign('transaction_id')
                ->references('id')
                ->on('gateway_transactions')
                ->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('gateway_transactions_logs');
    }
}
