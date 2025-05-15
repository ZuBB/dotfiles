# Function to return an override hostname if applicable
function hostname_override
    switch $argv[1]
        case MJLG2DL4HFL
            echo phoenix
        # Add more cases as needed
        # case MYHOSTNAME
        #     echo myalias
    end
end
