{
  ament-cmake-core,
  ament-cmake-gtest,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gmock-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ament_cmake_gmock" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gmock-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "a06a71147b4c99613e974798d80ff397f17b2dd7";
        hash = "sha256-629r4dPOVxHIhPWPr3WZtvcR2MyqMVWuLn37ZwViYhg=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_gmock";
  version = "2.7.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_gmock";
  nativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-gtest ament-cmake-test gmock-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "google-mock" ]; };
  buildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-gtest ament-cmake-test gmock-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "google-mock" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "The ability to add Google mock-based tests in the ament buildsystem in CMake.";
  };
})
