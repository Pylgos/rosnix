{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-pycodestyle,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_pycodestyle";
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_pycodestyle";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-pycodestyle ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_pycodestyle" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_pycodestyle-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "44eea7faf5dd246c821d12413748bb06b4ba241d";
          hash = "sha256-0aa2kp+MhECipjZtd6lRZ0BJe7t6A/3HD72++IbNu9w=";
        };
      };
    });
  };
  meta = {
    description = "The CMake API for ament_pycodestyle to check code against the style conventions in PEP 8.";
  };
})
