#!/usr/bin/env bash

echo "Configuring extra options..."
# Set admin email
occ user:modify admin email olivierbourdon38@free.fr
# Create new group
occ group:add users
# Self registration configuration
occ app:enable registration
occ config:app:set registration admin_approval_required --value no
occ config:app:set registration admin_email_notifications_required --value yes
occ config:app:set registration registered_user_group --value users

# Remove non necessary entries from skeleton
rm -rf /var/www/owncloud/core/skeleton/*.pdf /var/www/owncloud/core/skeleton/Documents \
	/var/www/owncloud/core/skeleton/Photos

true
