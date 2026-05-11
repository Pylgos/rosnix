{
  ament-cmake-core,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_gtest";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_gtest";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libgtest-dev" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgtest-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_gtest" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gtest-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "18c94e26ec4649f4b189eebb50f9d52eaaeba1e9";
        hash = "sha256-Kz7hhkJ60R+gfdEheZYZXdz+8cQ54wd4qs0+yh4RHMI=";
      };
    };
  });
  meta = {
    description = "The ability to add gtest-based tests in the ament buildsystem in CMake.";
  };
})
