#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:a5521bed2d31c4d554824f1c50fc358b7ccca540; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:a07b7048053a327370bb0cdee0d613d219a8d4ea \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:a5521bed2d31c4d554824f1c50fc358b7ccca540 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
