{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_control_cmake";
  version = "1.0.0-2";
  src = finalAttrs.passthru.sources."ros2_control_cmake";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_control_cmake" = substituteSource {
      src = fetchgit {
        name = "ros2_control_cmake-source";
        url = "https://github.com/ros2-gbp/ros2_control_cmake-release.git";
        rev = "fd644273f625a59a641eb998b1433f550556f8fd";
        hash = "sha256-xH4gl9hE7tA3Bof27MULy3H0aJ+hdE//mhB31iSAsDs=";
      };
    };
  });
  meta = {
    description = "Provides CMake macros used by the ros2_control framework";
  };
})
