# rando-scripts
Just a collection of scripts for general purpose use

# nginx-log-checker

- `ls -1t access.log*`: List all files in the current directory that start with `access.log`, sorted by modification time in reverse order.
- `${file##*.}`: Extract the file extension from the variable `$file`, used to determine whether the file is gzip-compressed.
- `zcat "$file"`: Uncompress the gzip-compressed file and write its contents to standard output.
- `head -n 1`: Print the first line of input.
- `awk`: A powerful text processing tool used to extract and manipulate fields from each line of input.
- `substr($7, 2)`: Extract a substring from the seventh field of each log entry, starting from the second character, to remove the initial quote and HTTP version. This gives us the requested URL.
- `print`: An `awk` command that prints the specified fields to standard output.
- `$8`, `$9`, `$11`: `awk` variables that refer to the 8th, 9th, and 11th fields of each log entry, containing the HTTP response code, referrer URL, and redirect target URL, respectively.
- `sort`: A command that sorts the input in ascending order by default, but can be used with the `-n` option to sort numerically, or with the `-r` option to sort in reverse order.
- `uniq -c`: A command that removes duplicate lines from the input and counts the number of occurrences of each line.
- `head`: A command that displays the first few lines of the input, used with the `-n` option to specify the number of lines to display.

