model_name=TimeLLM
train_epochs=10
learning_rate=0.01
llama_layers=32

master_port=05597
num_process=2
batch_size=24
d_model=16
d_ff=32

comment='LLAMA-Walmart-all'

accelerate launch --multi_gpu --mixed_precision bf16 --num_processes $num_process --main_process_port $master_port run_main.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path /home/oscar/Downloads/timellm_docker/Time-LLM/dataset/walmart_all/ \
  --data_path walmart_all.csv \
  --model_id walmart_all_64_12 \
  --model $model_name \
  --data Walmart \
  --features MS \
  --target Weekly_Sales \
  --seq_len 64 \
  --label_len 12 \
  --pred_len 12 \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 11 \
  --dec_in 11 \
  --c_out 11 \
  --d_model $d_model \
  --d_ff $d_ff \
  --batch_size $batch_size \
  --learning_rate $learning_rate \
  --llm_layers $llama_layers \
  --train_epochs $train_epochs \
  --model_comment $comment \
  --llm_model LLAMA \
  --llm_dim 4096
