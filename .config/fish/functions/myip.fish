function myip -d 'print your local IPv4'
    set -l IP (ifconfig | grep -E "10\.|172\.|192\." | awk '{print $2}')
    echo -e "$IP\nhttp://$IP\nhttps://$IP"
end

