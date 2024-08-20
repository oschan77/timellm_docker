model_name=TimeLLM
train_epochs=10
learning_rate=0.01
llama_layers=6

master_port=02697
num_process=8
batch_size=24
d_model=16
d_ff=32

comment='TimeLLM-ETTh1_demo_64_12'

accelerate launch --multi_gpu --mixed_precision bf16 --num_processes $num_process --main_process_port $master_port run_main.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path /scratch/PI/cemclo/Time-LLM/dataset/ETT-demo/ \
  --data_path ETTh1_demo.csv \
  --model_id ETTh1_64_12 \
  --model $model_name \
  --data Weather \
  --features M \
  --seq_len 64 \
  --label_len 12 \
  --pred_len 12 \
  --factor 1 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --des 'Exp' \
  --itr 1 \
  --d_model $d_model \
  --d_ff $d_ff \
  --batch_size $batch_size \
  --learning_rate $learning_rate \
  --llm_layers $llama_layers \
  --train_epochs $train_epochs \
  --model_comment $comment \
  --llm_model GPT2 \
  --llm_dim 768 \
  --patch_len 4

