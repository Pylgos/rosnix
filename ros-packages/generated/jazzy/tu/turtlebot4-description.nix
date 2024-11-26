{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-description,
  joint-state-publisher,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_description";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."turtlebot4_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-description joint-state-publisher robot-state-publisher urdf ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "turtlebot4_description" = substituteSource {
        src = fetchgit {
          name = "turtlebot4_description-source";
          url = "https://github.com/ros2-gbp/turtlebot4-release.git";
          rev = "ccfb5713bf190805b3b41df918bc2b99f7ddb686";
          hash = "sha256-BIElYVfO/DRlFM3pX8rxlelWrgR3QA6XSL+xXBzwd3w=";
        };
      };
    });
  };
  meta = {
    description = "Turtlebot4 Description package";
  };
})
