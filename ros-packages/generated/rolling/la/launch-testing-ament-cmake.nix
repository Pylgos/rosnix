{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "launch_testing_ament_cmake";
  version = "3.7.0-1";
  src = finalAttrs.passthru.sources."launch_testing_ament_cmake";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-test ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-test ];
  depsTargetTargetPropagated = [ launch-testing ];
  checkInputs = [ ament-cmake-copyright launch-testing ];
  passthru = {
    sources = mkSourceSet (sources: {
      "launch_testing_ament_cmake" = substituteSource {
        src = fetchgit {
          name = "launch_testing_ament_cmake-source";
          url = "https://github.com/ros2-gbp/launch-release.git";
          rev = "c427507052b761fb4f28e9b4b02544fd2c725c56";
          hash = "sha256-jnHNsAkYHWYexLLsdyhJF4fSeQn+yxdOIgjmgoqeR4s=";
        };
      };
    });
  };
  meta = {
    description = "A package providing cmake functions for running launch tests from the build.";
  };
})
