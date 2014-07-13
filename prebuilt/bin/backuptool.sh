#!/sbin/sh
#
# Backup and restore addon /system files
#

export C=/tmp/backupdir
export S=/system

# Preserve /system/addon.d in /tmp/addon.d
preserve_addon_d() {
  mkdir -p /tmp/addon.d/
  cp -a /system/addon.d/* /tmp/addon.d/
  chmod 755 /tmp/addon.d/*.sh
}

# Restore /system/addon.d in /tmp/addon.d
restore_addon_d() {
  cp -a /tmp/addon.d/* /system/addon.d/
  rm -rf /tmp/addon.d/
}

# Backup Xposed Framework (bin/app_process)
xposed_backup()
{
	if ( grep -ciE ".*with Xposed support \\(version (.+)\\).*" /system/bin/app_process )
		then
			cp /system/bin/app_process /tmp/backupdir/
	fi
}

# Restore Xposed Framework (bin/app_process)
xposed_restore()
{
	if [ -f /tmp/backupdir/app_process ]
		then
			mv /system/bin/app_process /system/bin/app_process.orig
			cp /tmp/backupdir/app_process /system/bin/
	fi
}

# Execute /system/addon.d/*.sh scripts with $1 parameter
run_stage() {
for script in $(find /tmp/addon.d/ -name '*.sh' |sort -n); do
  $script $1
done
}

case "$1" in
  backup)
    mkdir -p $C
    xposed_backup
    preserve_addon_d
    run_stage pre-backup
    run_stage backup
    run_stage post-backup
  ;;
  restore)
    xposed_restore
    run_stage pre-restore
    run_stage restore
    run_stage post-restore
    restore_addon_d
    rm -rf $C
    sync
  ;;
  *)
    echo "Usage: $0 {backup|restore}"
    exit 1
esac

exit 0
