;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.

(use-modules (gnu)
      (guix channels)
	    (nongnu packages linux)
	    (nongnu system linux-initrd))

;;needed for non-guix channel adding
(use-package-modules package-management)

(use-service-modules cups desktop networking ssh xorg)

;; Add Unofficial Channels
(define my-channels
  (cons* (channel 
            (name 'nonguix)
            (url "https://gitlab.com/nonguix/nonguix")
            (branch "master")
            (introduction
              (make-channel-introduction
                "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
                (openpgp-fingerprint
                  "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
            %default-channels))

(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (locale "en_US.utf8")
  (timezone "America/Chicago")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "guixOS")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "kritoke")
                  (comment "Kritoke")
                  (group "users")
                  (home-directory "/home/kritoke")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  ;;(packages (append (list (specification->package "nss-certs"))
  ;;                  %base-packages))

  (packages %base-packages)


  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
 (services
   (append (list (service gnome-desktop-service-type)

            ;; To configure OpenSSH, pass an 'openssh-configuration'
            ;; record as a second argument to 'service' below.
            (service openssh-service-type)
            (service cups-service-type)
            (set-xorg-configuration
            (xorg-configuration (keyboard-layout keyboard-layout))))

    (modify-services %desktop-services
      (guix-service-type
        config => (guix-configuration
                    (inherit config)
                    ;; add nonguix repo to default system config
                    (channels my-channels)
                    (guix (guix-for-channels my-channels))
                    ;; Add binary repo for nonguix
                    (substitute-urls
                    (append '("https://substitutes.nonguix.org")
                      %default-substitute-urls
                      '("https://bordeaux-us-east-mirror.cbaines.net/")))
                    (authorized-keys
                      (append (list (local-file "guix/substitutes.nonguix.org.pub"))
                        %default-authorized-guix-keys))
                  )))))

  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
  (swap-devices (list (swap-space
                        (target (uuid
                                 "b0be6d35-5eee-4ba6-b65e-348ed7322868")))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "5138-D0A1"
                                       'fat32))
                         (type "vfat"))
                       (file-system
                         (mount-point "/")
                         (device (uuid
                                  "c408af8b-12ca-491f-a8c0-803ce895801a"
                                  'ext4))
                         (type "ext4")) %base-file-systems)))

