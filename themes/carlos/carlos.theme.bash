# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.

SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" ${green}|"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

CONDAENV_THEME_PROMPT_SUFFIX="|"

function __bobby_clock() {
	printf '%s' "$(clock_prompt) "

	if [[ "${THEME_SHOW_CLOCK_CHAR:-}" == "true" ]]; then
		printf '%s' "$(clock_char) "
	fi
}
#__bobby_clock() {
#  printf "$(clock_prompt) "
#
#  if [ "${THEME_SHOW_CLOCK_CHAR}" == "true" ]; then
#    printf "$(clock_char) "
#  fi
#}

function prompt_command() {
    #PS1="${bold_cyan}$(scm_char)${green}$(scm_prompt_info)${purple}$(ruby_version_prompt) ${yellow}\h ${reset_color}in ${green}\w ${reset_color}\n${green}→${reset_color} "
    PS1="\n(${white}$(python_version_prompt)) $(battery_char) $(__bobby_clock)${yellow}$(ruby_version_prompt) ${green}\u@\h ${reset_color}in ${white}\w\n${bold_cyan}$(scm_prompt_char_info) ${bold_cyan}→${reset_color} "
}
#function prompt_command() {
#	PS1="\n$(battery_char) $(__bobby_clock)"
#	PS1+="${yellow?}$(ruby_version_prompt) "
#	PS1+="${purple?}\h "
#	PS1+="${reset_color?}in "
#	PS1+="${green?}\w\n"
#	PS1+="${bold_cyan?}$(scm_prompt_char_info) "
#	PS1+="${green?}→${reset_color?} "
#}
: "${THEME_SHOW_CLOCK_CHAR:="true"}"
: "${THEME_CLOCK_CHAR_COLOR:=${red?}}"
: "${THEME_CLOCK_COLOR:=${bold_cyan?}}"
: "${THEME_CLOCK_FORMAT:="%Y-%m-%d %H:%M:%S"}"

#THEME_SHOW_CLOCK_CHAR=${THEME_SHOW_CLOCK_CHAR:-"false"}
#THEME_CLOCK_CHAR_COLOR=${THEME_CLOCK_CHAR_COLOR:-"$red"}
#THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$bold_blue"}
#THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"%Y-%m-%d %I:%M:%S"}
#THEME_SHOW_PYTHON=true

safe_append_prompt_command prompt_command
