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
  pname = "rmf_cmake_uncrustify";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."rmf_cmake_uncrustify";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-uncrustify ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-uncrustify ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_cmake_uncrustify" = substituteSource {
      src = fetchgit {
        name = "rmf_cmake_uncrustify-source";
        url = "https://github.com/ros2-gbp/rmf_cmake_uncrustify-release.git";
        rev = "66787d123188380569a9ad1d29680caad59e36ac";
        hash = "sha256-YwXGjK9Uaj03Os5oVwylNtS6dDmirgOgm6bY+0K+8Ic=";
      };
    };
  });
  meta = {
    description = "\n    ament_cmake_uncrustify with support for parsing a config file.\n    ";
  };
})
