{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-uncrustify,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_uncrustify";
  version = "0.17.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_uncrustify";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-uncrustify ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-uncrustify ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_uncrustify" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "983e88e8510798c92e417f78e313b507372806ac";
        hash = "sha256-IDea68NC3+IEyEZZbTD/RcaZ49NZeaL344wwIm5J4/Q=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_uncrustify to check code against styleconventions\n    using uncrustify.\n  ";
  };
})
