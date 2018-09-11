#!/usr/bin/env groovy

library("govuk@change-rails-detection")

node {
  govuk.buildProject(
    beforeTest: {
      govuk.setEnvar("TEST_COVERAGE", "true")
    }
  )
}
