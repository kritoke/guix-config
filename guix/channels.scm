(cons* (channel
        (name 'guix)
        (url "https://git.savannah.gnu.org/git/guix.git")
        (branch "master")
        (commit
          "65e8472a4b6fc6f66871ba0dad518b7d4c63595e")
        (introduction
          (make-channel-introduction
            "9edb3f66fd807b096b48283debdcddccfea34bad"
            (openpgp-fingerprint
              "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA"))))
      (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        (branch "master")
        (introduction
          (make-channel-introduction
            "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
            (openpgp-fingerprint
              "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
      (channel
          (name 'glarus)
          (url "https://code.glarus.dev/guix/channel.git")
          (introduction
            (make-channel-introduction
            "08f6249fba55c9aed16a8ffd897b28c823044b1f"
            (openpgp-fingerprint
              "9E23 D5BC AEB7 E364 7321  4A00 C3A7 8EB3 FEFE 6C04"))))
           %default-channels)
