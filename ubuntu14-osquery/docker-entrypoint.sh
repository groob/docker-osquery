#!bin/sh
# see https://github.com/facebook/osquery/issues/2819 for reference

# FIXME note that product_uuid is in a read-only filesystem unless we explicitly
# use a volume. Maybe check if the file is writable first? Or make the error silent.
if [ ! -f /.osquery-uuidgen ]; then
    uuidgen > /sys/class/dmi/id/product_uuid
    touch /.osquery-uuidgen
fi
exec "$@"
