# General manage.py
function pm
    python manage.py
end
function pmr
    python manage.py runserver
end
function pmrp
    python manage.py runserver_plus
end
function pmrpg
    pmrp --adminmedia (pwd)/media/admin
end
function pmsdb
    python manage.py syncdb
end
function pms
    python manage.py shell
end
function pmsp
    python manage.py shell_plus
end
function pmlf
    python manage.py loaddata fixtures/*
end
function pmt
    python -W ignore::DeprecationWarning manage.py test
end

# South aliases
function pmdm
    python manage.py datamigration
end
function pmsm
    python manage.py schemamigration --auto
end
function pmsi
    python manage.py schemamigration --initial
end
function pmm
    python manage.py migrate
end
function pmma
    python manage.py migrate --all
end
function pmml
    python manage.py migrate --list
end
function pmmf
    python manage.py migrate --fake
end
function pmcats
    python manage.py convert_to_south
end
