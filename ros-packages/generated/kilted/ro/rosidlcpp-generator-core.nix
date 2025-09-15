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
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_generator_core";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_generator_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_generator_core" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_generator_core-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "b8fbc3aa9dd1565baf5402b97f4d898680c3d9b3";
        hash = "sha256-i5iLHA2tDoTuWflUgLOuITC2Jlyy2WYdKWUfdTbDCkI=";
      };
    };
  });
  meta = {
    description = "This package provides the basis for all rosidlcpp generators";
  };
})
