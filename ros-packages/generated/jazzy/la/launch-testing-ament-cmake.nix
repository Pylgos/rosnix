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
  python-cmake-module,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "launch_testing_ament_cmake";
  version = "3.4.3-1";
  src = finalAttrs.passthru.sources."launch_testing_ament_cmake";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-test python-cmake-module ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-test python-cmake-module ];
  depsTargetTargetPropagated = [ launch-testing ];
  checkInputs = [ ament-cmake-copyright launch-testing python-cmake-module ];
  passthru.sources = mkSourceSet (sources: {
    "launch_testing_ament_cmake" = substituteSource {
      src = fetchgit {
        name = "launch_testing_ament_cmake-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "e518df91dddff392ecfe083f680166df61eb3545";
        hash = "sha256-WPq8TlEsz+PSsFHxuMqs5rB8pA/93Ju0kZL4APJRvGI=";
      };
    };
  });
  meta = {
    description = "A package providing cmake functions for running launch tests from the build.";
  };
})
