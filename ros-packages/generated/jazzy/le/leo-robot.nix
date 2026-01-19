{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo,
  leo-bringup,
  leo-filters,
  leo-fw,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_robot";
  version = "2.5.1-1";
  src = finalAttrs.passthru.sources."leo_robot";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ leo leo-bringup leo-filters leo-fw ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo leo-bringup leo-filters leo-fw ];
  passthru.sources = mkSourceSet (sources: {
    "leo_robot" = substituteSource {
      src = fetchgit {
        name = "leo_robot-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "3ca15f5442ed7439f0c26a94f26246268ee01e91";
        hash = "sha256-muM2gq5H7XcSfvzctmXGhKcijjAChYLuz2WNlP6aHOE=";
      };
    };
  });
  meta = {
    description = "Metapackage of software to install on Leo Rover.";
  };
})
