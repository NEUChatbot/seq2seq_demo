@echo off
set test_arg="False"
set bleu_arg=-1

if "%1"=="test" (
    set test_arg="True"
) else if "%1"=="bleu" (
    if "%2"=="" (
        echo "no bleu params"
        exit
    )
    set bleu_arg=%2
)
python s2s.py --size 1024 --num_layers 2 --num_epoch 5 --batch_size 64 --num_per_epoch 500000 --test %test_arg% --bleu %bleu_arg% --model_dir ./model/model1