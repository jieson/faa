<?php

namespace addons\ygame\controller;

include_once __DIR__."/../library/workerman/src/Worker.php";
include_once __DIR__."/../library/workerman/src/Timer.php";
include_once __DIR__."/../library/workerman/src/Events/EventInterface.php";
include_once __DIR__."/../library/workerman/src/Events/Select.php";

use Workerman\Timer;
use Workerman\Worker;


class Work
{
    public function run(){

        if (\PHP_SAPI !== 'cli') {
            exit("Only run in command line mode \n");
        }

        $task = new Worker();
        $task->onWorkerStart = function ($task) {

            if($task->id == 0){
                Timer::add(5, function () {
                    \addons\ygame\service\Order::cancel_order();      //取消过期订单
                });
            }
        };

        Worker::runAll();
    }
}

