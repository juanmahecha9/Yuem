# Change the value of options to whatever you want to use.
options=("HTML" "pug" "handlebars" "ejs")

select_option (){
  # little helpers for terminal print control and key input
  ESC=$(printf '%b' "\033")

  cursor_blink_on() {
    printf '%s' "$ESC[?25h"
  }

  cursor_blink_off() {
    printf '%s' "$ESC[?25l"
  }

  cursor_to() {
    printf '%s' "$ESC[$1;${2:-1}H"
  }

  print_option() {
    printf '   %s ' "$1"
  }

  print_selected() {
    printf '  %s' "$ESC[7m $1 $ESC[27m"
  }

  get_cursor_row() {
    IFS=';' read -sdR -p $'\E[6n' ROW COL; printf '%s' ${ROW#*[}
  }

  key_input() {
    read -s -n3 key 2>/dev/null >&2
    if [[ $key = $ESC[A ]]; then
      echo up
    fi
    if [[ $key = $ESC[B ]]; then
      echo down
    fi
    if [[ $key = ""  ]]; then
      echo enter
    fi
  }

   # initially print empty new lines (scroll down if at bottom of screen)
   for opt; do
     printf "\n"
   done

   # determine current screen position for overwriting the options
   local lastrow=$(get_cursor_row)
   local startrow=$(($lastrow - $#))

   # ensure cursor and input echoing back on upon a ctrl+c during read -s
   trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
   cursor_blink_off

   local selected=0
   while true; do
     # print options by overwriting the last lines
     local idx=0
     for opt; do
       cursor_to $((startrow + idx))
       if [[ $idx == $selected ]]; then
         print_selected "$opt"
       else
         print_option "$opt"
       fi
       ((idx++))
     done

     # user key control
     case $(key_input) in
       enter) break;;
       up)    ((selected--));
         if (( $selected < 0 )); then selected=$(($# - 1)); fi;;
         down)  ((selected++));
           if (( selected > $# )); then selected=0; fi;;
         esac
       done

       # cursor position back to normal
       cursor_to $lastrow
       printf "\n"
       cursor_blink_on

       return "$selected"
}


select_option "${options[@]}"
choice=$?

index=$choice
value=${options[$choice]}

case $value in
HTML) 
sh ./scripts/yuem-html.sh
break;;
pug) 
sh ./scripts/yuem-pug.sh
break;;
handlebars)
sh ./scripts/yuem-hbs.sh
 break;;
 ejs)
 sh ./scripts/yuem-ejs.sh
 break;;
esac