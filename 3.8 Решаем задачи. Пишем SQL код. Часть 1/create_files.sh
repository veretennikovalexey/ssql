#!/bin/bash

for i in {1..14}; do
    # Форматируем номер с ведущим нулём для чисел меньше 10
    num=$(printf "%02d" $i)
    filename="${num}.sql"
    
    # Создаём файл с нужным содержимым
    cat > "$filename" <<EOF
/*

*/
EOF
    
done

# create_files.sh


