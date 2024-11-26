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
  version = "3.4.2-2";
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
        rev = "afe506445d42429c57e0486867d866ab7054a8a0";
        hash = "sha256-5+zwcqUD4kG22oYJie85A8Wl3jxRdcPmkUcQu/nGCFI=";
      };
    };
  });
  meta = {
    description = "A package providing cmake functions for running launch tests from the build.";
  };
})
