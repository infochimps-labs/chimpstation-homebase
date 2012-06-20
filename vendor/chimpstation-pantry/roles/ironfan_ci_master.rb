name        "ironfan_ci_master"
description "Chimpstation: sets up a local Ironfan-CI master"

run_list(
  # 'role[jenkins_master]'
  )

default_attributes({
    :jenkins => {
      :server => {
        :host      => '0.0.0.0',
        :port      => 8700,
        :plugins   => %w[ github git github-oauth emotional-hudson greenballs dashboard-view ],
        :run_state => 'start',
      },
      :worker => {
        # :home_dir  => "/data/jenkins/jenkins-node",
      },
    },
    :ruby => { :version => '1.9.1' }, # NOTE: 1.9.1 means 1.9.2. Yes, that is stupid.
  })
