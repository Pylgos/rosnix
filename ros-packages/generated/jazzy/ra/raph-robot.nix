{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  raph,
  raph-bringup,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raph_robot";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."raph_robot";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ raph raph-bringup ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ raph raph-bringup ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "raph_robot" = substituteSource {
      src = fetchgit {
        name = "raph_robot-source";
        url = "https://github.com/ros2-gbp/raph_robot-release.git";
        rev = "4cc23daec827581593ef2d0dae5630768f0fa0d4";
        hash = "sha256-LxcUU6AzM5wejJnZWVJnMPeLyuPW5Xm4jBcj9z+8qmc=";
      };
    };
  });
  meta = {
    description = "Packages for Raph Rover running on the robot.";
  };
})
