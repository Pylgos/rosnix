{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_minimal_tb4_description";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."nav2_minimal_tb4_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ joint-state-publisher robot-state-publisher urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher robot-state-publisher urdf xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_minimal_tb4_description" = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb4_description-source";
        url = "https://github.com/ros2-gbp/nav2_minimal_turtlebot_simulation-release.git";
        rev = "dd857f796dbc9de74e34470d8d525c9caaa3f54a";
        hash = "sha256-ph6mZPKZtZq0oZab62PQfIFX92/ylTHf6I3HZ5PUeag=";
      };
    };
  });
  meta = {
    description = "Nav2's minimum Turtlebot4 Description package";
  };
})
