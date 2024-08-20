model_name=TimeLLM
train_epochs=10
learning_rate=0.01
llama_layers=32

master_port=05597
num_process=8
batch_size=24
d_model=16
d_ff=32

comment='TimeLLM-Walmart-5s'

accelerate launch --multi_gpu --mixed_precision bf16 --num_processes $num_process --main_process_port $master_port run_main_noval.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --root_path /scratch/PI/cemclo/Time-LLM/dataset/walmart_5s/ \
  --data_path walmart_5s.csv \
  --model_id walmart_1s_64_12 \
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
  --llm_model GPT2 \
  --llm_dim 768