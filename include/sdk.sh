#!/bin/sh

. $POSTURE_PATH/include/internal/helper.sh

if [ ! -f "$POSTURE_PATH/.env" ]; then
    cp "$POSTURE_PATH/.env.example" "$POSTURE_PATH/.env"
fi

parse_env_file "$POSTURE_PATH/.env"
