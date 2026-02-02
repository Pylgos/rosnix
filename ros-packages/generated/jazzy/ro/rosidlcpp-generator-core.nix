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
  version = "0.5.0-1";
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
        rev = "15b88b0059bc44963774c833e46424fd17a8a723";
        hash = "sha256-Oq/o4sl3i60CQCQZiwDHxR6ss1Ajj0P5Kn7hdV5XLJ4=";
      };
    };
  });
  meta = {
    description = "This package provides the basis for all rosidlcpp generators";
  };
})
