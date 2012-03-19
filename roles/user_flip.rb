name        "user_flip"
description "Per-user overrides: flip."


default_attributes({
    :osx_prefs => {
      :locate => { :prunepaths => %w[ /foo /data/ripd /lion-away  /Users/flip/Library/Mail ] },
    },

  })
