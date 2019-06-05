BIFOCALE_DIR="large-corpus"


PREFIX="_methodname_split_magret"
ADJ_PREFIX="_lg_corpus"
SUFFIX="_methodname_large"

KERAS_PREFIX="keras${PREFIX}"
SKLEARN_PREFIX="sklearn${PREFIX}"
PYTORCH_PREFIX="pytorch${PREFIX}"
ANSIBLE_PREFIX="ansible${PREFIX}"
REQUESTS_PREFIX="requests${PREFIX}"
DJANGO_PREFIX="django${PREFIX}"
HTTPIE_PREFIX="httpie${PREFIX}"
YT_PREFIX="youtube-dl${PREFIX}"
FLASK_PREFIX="flask${PREFIX}"
BERT_PREFIX="bert${PREFIX}"


IN_KERAS=$BIFOCALE_DIR/${KERAS_PREFIX}_tk.txt
IN_SKLEARN=$BIFOCALE_DIR/${SKLEARN_PREFIX}_tk.txt
IN_PYTORCH=$BIFOCALE_DIR/${PYTORCH_PREFIX}_tk.txt
IN_ANSIBLE=$BIFOCALE_DIR/${ANSIBLE_PREFIX}_tk.txt
IN_REQUESTS=$BIFOCALE_DIR/${REQUESTS_PREFIX}_tk.txt
IN_DJANGO=$BIFOCALE_DIR/${DJANGO_PREFIX}_tk.txt
IN_HTTPIE=$BIFOCALE_DIR/${HTTPIE_PREFIX}_tk.txt
IN_YT=$BIFOCALE_DIR/${YT_PREFIX}_tk.txt
IN_FLASK=$BIFOCALE_DIR/${FLASK_PREFIX}_tk.txt
IN_BERT=$BIFOCALE_DIR/${BERT_PREFIX}_tk.txt

IN_LABEL_KERAS=$BIFOCALE_DIR/${KERAS_PREFIX}_label.txt
IN_LABEL_SKLEARN=$BIFOCALE_DIR/${SKLEARN_PREFIX}_label.txt
IN_LABEL_PYTORCH=$BIFOCALE_DIR/${PYTORCH_PREFIX}_label.txt
IN_LABEL_ANSIBLE=$BIFOCALE_DIR/${ANSIBLE_PREFIX}_label.txt
IN_LABEL_REQUESTS=$BIFOCALE_DIR/${REQUESTS_PREFIX}_label.txt
IN_LABEL_DJANGO=$BIFOCALE_DIR/${DJANGO_PREFIX}_label.txt
IN_LABEL_HTTPIE=$BIFOCALE_DIR/${HTTPIE_PREFIX}_label.txt
IN_LABEL_YT=$BIFOCALE_DIR/${YT_PREFIX}_label.txt
IN_LABEL_FLASK=$BIFOCALE_DIR/${FLASK_PREFIX}_label.txt
IN_LABEL_BERT=$BIFOCALE_DIR/${BERT_PREFIX}_label.txt

IN_VAL_KERAS=$BIFOCALE_DIR/${KERAS_PREFIX}_tk_val.txt
IN_VAL_SKLEARN=$BIFOCALE_DIR/${SKLEARN_PREFIX}_tk_val.txt
IN_VAL_PYTORCH=$BIFOCALE_DIR/${PYTORCH_PREFIX}_tk_val.txt
IN_VAL_ANSIBLE=$BIFOCALE_DIR/${ANSIBLE_PREFIX}_tk_val.txt
IN_VAL_REQUESTS=$BIFOCALE_DIR/${REQUESTS_PREFIX}_tk_val.txt
IN_VAL_DJANGO=$BIFOCALE_DIR/${DJANGO_PREFIX}_tk_val.txt
IN_VAL_HTTPIE=$BIFOCALE_DIR/${HTTPIE_PREFIX}_tk_val.txt
IN_VAL_YT=$BIFOCALE_DIR/${YT_PREFIX}_tk_val.txt
IN_VAL_FLASK=$BIFOCALE_DIR/${FLASK_PREFIX}_tk_val.txt
IN_VAL_BERT=$BIFOCALE_DIR/${BERT_PREFIX}_tk_val.txt

IN_LABEL_VAL_KERAS=$BIFOCALE_DIR/${KERAS_PREFIX}_label_val.txt
IN_LABEL_VAL_SKLEARN=$BIFOCALE_DIR/${SKLEARN_PREFIX}_label_val.txt
IN_LABEL_VAL_PYTORCH=$BIFOCALE_DIR/${PYTORCH_PREFIX}_label_val.txt
IN_LABEL_VAL_ANSIBLE=$BIFOCALE_DIR/${ANSIBLE_PREFIX}_label_val.txt
IN_LABEL_VAL_REQUESTS=$BIFOCALE_DIR/${REQUESTS_PREFIX}_label_val.txt
IN_LABEL_VAL_DJANGO=$BIFOCALE_DIR/${DJANGO_PREFIX}_label_val.txt
IN_LABEL_VAL_HTTPIE=$BIFOCALE_DIR/${HTTPIE_PREFIX}_label_val.txt
IN_LABEL_VAL_YT=$BIFOCALE_DIR/${YT_PREFIX}_label_val.txt
IN_LABEL_VAL_FLASK=$BIFOCALE_DIR/${FLASK_PREFIX}_label_val.txt
IN_LABEL_VAL_BERT=$BIFOCALE_DIR/${BERT_PREFIX}_label_val.txt


PRETRAIN_DIR="large-corpus"

export CUDA_VISIBLE_DEVICES=1

python classifier.py \
  --do_train=True \
  --do_eval=False \
  --do_predict=True \
  --max_nb_preds=100000 \
  --task_name=methodname \
  --label_vocab=$BIFOCALE_DIR/label_vocab.csv \
  --vocab_file=$BIFOCALE_DIR/global_vocab.csv \
  --init_checkpoint=$PRETRAIN_DIR/pretraining_output-400k/model.ckpt-400000 \
  --train_file=$IN_KERAS,$IN_SKLEARN,$IN_PYTORCH,$IN_ANSIBLE,$IN_REQUESTS,$IN_DJANGO,$IN_HTTPIE,$IN_YT,$IN_FLASK,$IN_BERT \
  --train_labels=$IN_LABEL_KERAS,$IN_LABEL_SKLEARN,$IN_LABEL_PYTORCH,$IN_LABEL_ANSIBLE,$IN_LABEL_REQUESTS,$IN_LABEL_DJANGO,$IN_LABEL_HTTPIE,$IN_LABEL_YT,$IN_LABEL_FLASK,$IN_LABEL_BERT \
  --train_adj=$BIFOCALE_DIR \
  --eval_file=$IN_VAL_KERAS,$IN_VAL_SKLEARN,$IN_VAL_PYTORCH,$IN_VAL_ANSIBLE,$IN_VAL_REQUESTS,$IN_VAL_DJANGO,$IN_VAL_HTTPIE,$IN_VAL_YT,$IN_VAL_FLASK,$IN_VAL_BERT \
  --eval_labels=$IN_LABEL_VAL_KERAS,$IN_LABEL_VAL_SKLEARN,$IN_LABEL_VAL_PYTORCH,$IN_LABEL_VAL_ANSIBLE,$IN_LABEL_VAL_REQUESTS,$IN_LABEL_VAL_DJANGO,$IN_LABEL_VAL_HTTPIE,$IN_LABEL_VAL_YT,$IN_LABEL_VAL_FLASK,$IN_LABEL_VAL_BERT \
  --eval_adj=$BIFOCALE_DIR \
  --data_dir=$BIFOCALE_DIR \
  --output_dir=$BIFOCALE_DIR/cls_output-methodname-lg2 \
  --max_seq_length=64 \
  --train_batch_size=16 \
  --learning_rate=1e-4 \
  --num_train_epochs=150 \
  --save_checkpoints_steps=1000 \
  --bert_config_file=$PRETRAIN_DIR/shallow_config.json \
  --sparse_adj=True \
  --adj_prefix=$KERAS_PREFIX,$SKLEARN_PREFIX,$PYTORCH_PREFIX,$ANSIBLE_PREFIX,$REQUESTS_PREFIX,$DJANGO_PREFIX,$HTTPIE_PREFIX,$YT_PREFIX,$FLASK_PREFIX,$BERT_PREFIX \
  --clean_data=True \
#  --shuffle=True


