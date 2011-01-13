function pretty_json -d "Prettify JSON data from standard in and print it on stdout."
    python -mjson.tool
end

function curl_json -d "Download the JSON from the given URL, prettify it, and print it to stdout."
    curl -sS $argv | pretty_json
end
