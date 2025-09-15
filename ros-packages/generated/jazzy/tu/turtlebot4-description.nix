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
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."turtlebot4_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ irobot-create-description joint-state-publisher robot-state-publisher urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-description joint-state-publisher robot-state-publisher urdf ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_description" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_description-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "9a547b9d0ee57ea3b67b334b39186f9f8c758b70";
        hash = "sha256-nFTtnko2dabUNLkFRoYLN5zWwFDpRph4zG/M8RlZ28Q=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Description package";
  };
})
