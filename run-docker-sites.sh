#!/usr/bin/env bash

current_path="$(pwd)" ;
cd "${current_path}" ;


arraySites=(
"https://us.shein.com/New-in-Trends-sc-00654187.html"
"https://www.shopee.sg/Computers-Peripherals-cat.11013247"
"https://www.amazon.com/Best-Sellers/zgbs"
"https://www.ebay.com/b/Dolce-Gabbana-Bags-Handbags-for-Women/169291/bn_716146"
"https://www.dianping.com/beijing/ch10/g110"
)

for site in "${arraySites[@]}";
do
        var=$(eval 'echo '$site' | cut -d'/' -f3')
        site_name=$(eval 'echo $var | cut -d '.' -f2')
        echo $site_name
        docker build -t "exotic-${site_name}" -f "${current_path}/Dockerfile" "${current_path}/"
        docker run -e URL="${site}" -t -d -P -v "${current_path}/tmp/pulsar-root:/tmp/pulsar-root" --name "exotic-${site_name}" "exotic-${site_name}:latest"
done

#docker build -t exotic-generic . ;
#docker run -e URL="https://us.shein.com/New-in-Trends-sc-00654187.html" -t -d -P -v ./tmp/pulsar-root:/tmp/pulsar-root --name generic-exotic exotic-generic:latest ;


